import 'package:dartz/dartz.dart';

import 'package:vee/core/errors/failures.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../data/models/forogt_password_request_body.dart';
import '../entities/forgot_password_entity.dart';
import '../repositories/auth_repo.dart';

class ForgotPasswordUseCase implements BaseUseCase<ForgotPasswordRequestBody, ForgotPasswordEntity> {
  final AuthRepository _authRepository;
  ForgotPasswordUseCase(this._authRepository);
  @override
  Future<Either<Failure, ForgotPasswordEntity>> call(ForgotPasswordRequestBody input) {
    return _authRepository.forgotPassword(input);
  }
}