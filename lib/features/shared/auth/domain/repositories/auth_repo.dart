import 'package:dartz/dartz.dart';
import 'package:vee/features/shared/auth/data/models/login_request_body.dart';
import 'package:vee/features/shared/auth/data/models/login_response.dart';

import '../../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(LoginRequestBody input, {
   LoginRequestBody loginRequestBody,
  }); 
 
  Future<Either<Failure, Unit >> forgotPassword(String email);

  Future<Either<Failure, Unit>> resetPassword();
  
}

