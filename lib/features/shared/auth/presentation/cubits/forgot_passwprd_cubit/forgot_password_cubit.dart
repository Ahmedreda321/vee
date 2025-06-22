import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/features/shared/auth/data/models/forogt_password_request_body.dart';
import '../../../domain/usecases/forgot_password_use_case.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  ForgotPasswordCubit(this.forgotPasswordUseCase)
      : super(const ForgotPasswordState.initial());

  final emailController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  void forgotPassword(
      ForgotPasswordRequestBody forgotPasswordRequestBody) async {
    emit(const ForgotPasswordState.loading());

    final result = await forgotPasswordUseCase(forgotPasswordRequestBody);

    result.fold(
      (failure) => emit(ForgotPasswordState.error(failure.message)),
      (data) => emit(ForgotPasswordState.success(data)),
    );
  }
}
