import 'package:dartz/dartz.dart';
import 'package:vee/features/shared/auth/data/mapper/login_mapper.dart';


import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/error_handeler.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_remot_data_source.dart';
import '../models/login_request_body.dart';

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
  Future<Either<Failure, LoginEntity>> login(
      LoginRequestBody loginRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemotDataSource.login(loginRequestBody);
        if (response.statusCode == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(response.message ?? ResponseMessage.DEFAULT,
                response.statusCode ?? ResponseCode.DEFAULT),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
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
