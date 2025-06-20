import 'package:dartz/dartz.dart';
import 'package:vee/core/errors/failures.dart';
import 'package:vee/features/shared/auth/data/models/login_request_body.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../entities/login_entity.dart';
import '../repositories/auth_repo.dart';

class LoginUseCase implements BaseUseCase<LoginRequestBody, LoginEntity> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(LoginRequestBody input) {
    return authRepository.login(input);
  }
}
