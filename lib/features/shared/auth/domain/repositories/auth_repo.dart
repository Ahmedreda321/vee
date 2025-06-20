import 'package:dartz/dartz.dart';


import '../../../../../core/errors/failures.dart';
import '../../data/models/login_request_body.dart';
import '../entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(
    LoginRequestBody loginRequestBody,
  );

  Future<Either<Failure, Unit>> forgotPassword(String email);

  Future<Either<Failure, Unit>> resetPassword();
}
