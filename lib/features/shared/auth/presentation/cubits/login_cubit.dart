import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/login_request_body.dart';
import '../../domain/usecases/login_use_case.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {

 final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(const LoginInitial());


  void login( LoginRequestBody loginRequestBody) async{
    emit(const LoginLoading());
    final result = await loginUseCase(loginRequestBody);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (loginEntity) => emit(LoginSuccess(loginEntity)),
    );
  }
}
