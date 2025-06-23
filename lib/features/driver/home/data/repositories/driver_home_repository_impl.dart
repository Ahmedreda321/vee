import 'package:dartz/dartz.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/error_handeler.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/driver_home_entities.dart';
import '../../domain/repositories/driver_home_repository.dart';
import '../datasources/driver_home_remot_data_source.dart';
import '../mapper/driver_home_mapper.dart';

class DriverHomeRepositoryImpl implements DriverHomeRepository {
  final NetworkInfo _networkInfo;
  final DriverHomeRemoteDataSource _driverHomeRemoteDataSource;
  DriverHomeRepositoryImpl(
      {required NetworkInfo networkInfo,
      required DriverHomeRemoteDataSource driverHomeRemoteDataSource})
      : _networkInfo = networkInfo,
        _driverHomeRemoteDataSource = driverHomeRemoteDataSource;

  @override
  Future<Either<Failure, DriverHomeEntities>> getDriverHomeData() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _driverHomeRemoteDataSource.getDriverTrips();
        if (response.statusCode == ResponseCode.SUCCESS) {
          final trips =
              response.trips?.map((trip) => trip.toDomain()).toList() ?? [];
          trips.sort((a, b) {
            if (a.status == AppStrings.pending && b.status != AppStrings.pending) {
              return -1;
            } else if (a.status != AppStrings.pending && b.status == AppStrings.pending) {
              return 1;
            } else {
              return 0; 
            }
          });
          return Right(DriverHomeEntities(trips: trips));
        } else {
          return Left(
            ErrorHandler.handle(
              Failure(response.message ?? ResponseMessage.DEFAULT,
                  response.statusCode ?? ResponseCode.DEFAULT),
            ).failure,
          );
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
