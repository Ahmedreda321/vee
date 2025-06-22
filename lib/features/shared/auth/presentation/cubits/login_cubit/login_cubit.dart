import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/network/dio_factory.dart';
import '../../../../../../core/utils/app_shared_pref_consts.dart';
import '../../../../../../core/utils/app_shared_preferences.dart';
import '../../../data/models/login_request_body.dart';
import '../../../domain/usecases/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(const LoginInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login(LoginRequestBody loginRequestBody) async {
    emit(const LoginLoading());
    final result = await loginUseCase(loginRequestBody);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (loginEntity) async {
        if (loginEntity.businessUser != null) {
          await saveUserData(
            token: loginEntity.token,
            role: loginEntity.businessUser?.role,
          );
        }
        emit(LoginSuccess(loginEntity));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  Future<void> saveUserData({ required String token, required String? role}) async {
    await AppPreferences.setSecureData(
        AppSharedPrefConsts.userToken, token );
    await AppPreferences().setData(AppSharedPrefConsts.userRole, role);
    DioFactory.refreshHeadersAfterLogin(token);
  }
}
