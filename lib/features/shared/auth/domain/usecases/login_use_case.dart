import 'package:dartz/dartz.dart';
import 'package:vee/core/errors/failures.dart';
import 'package:vee/features/shared/auth/data/models/login_request_body.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../entities/login_entity.dart';

class LoginUseCase implements BaseUseCase<LoginRequestBody, LoginEntity> {
  final AuthRepositoryImpl _authRepositoryImpl;

  LoginUseCase(this._authRepositoryImpl);

  @override
  Future<Either<Failure, LoginEntity>> call(LoginRequestBody input) {
    return _authRepositoryImpl.login(input);
  }
}
