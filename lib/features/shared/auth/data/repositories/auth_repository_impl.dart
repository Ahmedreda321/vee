import 'package:dartz/dartz.dart';
import 'package:vee/core/errors/failures.dart';
import 'package:vee/features/shared/auth/data/models/login_request_body.dart';
import 'package:vee/features/shared/auth/data/models/login_response.dart';

import '../../../../../core/network/error_handeler.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_remot_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo _networkInfo;
  final AuthRemotDataSource _authRemotDataSource;
  AuthRepositoryImpl({
    required NetworkInfo networkInfo,
    required AuthRemotDataSource authRemotDataSource,
  })  : _networkInfo = networkInfo,
        _authRemotDataSource = authRemotDataSource;

  @override
  Future<Either<Failure, Unit>> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LoginResponse>> login({LoginRequestBody loginRequestBody}) async{
if (await _networkInfo.isConnected) {
    try {
      final response = await _authRemotDataSource.login(loginRequestBody);
      return Right(response);
    } catch (e) {
      return Left(Failure(
              response.message ?? ResponseMessage.DEFAULT,
              response.code ?? ResponseCode.DEFAULT));
    }
  } else {
  return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  
}
  }

  @override
  Future<Either<Failure, Unit>> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

}
