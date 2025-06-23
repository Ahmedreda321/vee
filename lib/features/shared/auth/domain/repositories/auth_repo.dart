import 'package:dartz/dartz.dart';


import '../../../../../core/errors/failures.dart';
import '../../data/models/forogt_password_request_body.dart';
import '../../data/models/login_request_body.dart';
import '../entities/forgot_password_entity.dart';
import '../entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(
    LoginRequestBody loginRequestBody,
  );

  Future<Either<Failure, ForgotPasswordEntity>> forgotPassword(ForgotPasswordRequestBody forgotPasswordRequestBody);

  Future<Either<Failure, Unit>> resetPassword();
}
