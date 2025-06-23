import 'package:dartz/dartz.dart';

import 'package:vee/core/errors/failures.dart';
import 'package:vee/features/shared/auth/data/repositories/auth_repository_impl.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../data/models/forogt_password_request_body.dart';
import '../entities/forgot_password_entity.dart';

class ForgotPasswordUseCase
    implements BaseUseCase<ForgotPasswordRequestBody, ForgotPasswordEntity> {
  final AuthRepositoryImpl _authRepositoryImpl;
  ForgotPasswordUseCase(this._authRepositoryImpl);
  @override
  Future<Either<Failure, ForgotPasswordEntity>> call(
      ForgotPasswordRequestBody input) {
    return _authRepositoryImpl.forgotPassword(input);
  }
}
