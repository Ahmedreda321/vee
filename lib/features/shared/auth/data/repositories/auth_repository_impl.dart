import 'package:dartz/dartz.dart';
import 'package:vee/features/shared/auth/data/mapper/auth_mapper.dart';
import 'package:vee/features/shared/auth/data/models/forogt_password_request_body.dart';
import 'package:vee/features/shared/auth/domain/entities/forgot_password_entity.dart';

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
  Future<Either<Failure, LoginEntity>> login(
      LoginRequestBody loginRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemotDataSource.login(loginRequestBody);
        if (response.statusCode == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            ErrorHandler.handle(
              Failure(response.message ?? ResponseMessage.DEFAULT,
                  response.statusCode ?? ResponseCode.DEFAULT),
            ).failure,
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

  @override
  Future<Either<Failure, ForgotPasswordEntity>> forgotPassword(
      ForgotPasswordRequestBody forgotPasswordRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemotDataSource
            .forgotPassword(forgotPasswordRequestBody);
        if (response != null) {
          return Right(response.toDomain());
        } else {
          return Left(
            ErrorHandler.handle(
              Failure(ResponseMessage.DEFAULT, ResponseCode.DEFAULT),
            ).failure,
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
