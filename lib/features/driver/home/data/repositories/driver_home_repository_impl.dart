import 'package:dartz/dartz.dart';
import 'package:vee/core/services/logger_service.dart';
import 'package:vee/features/driver/home/data/models/fault_report_model.dart';
import 'package:vee/features/driver/home/data/models/trip_report_model.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/models/base_data_source.dart';
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
                AppLogger.f("يسينةكسيةسيمنةبنيسة");

        final response = await _driverHomeRemoteDataSource.getDriverTrips();
        AppLogger.f(response.statusCode);
        if (response.statusCode == ResponseCode.SUCCESS) {
          final trips = response.trips
                  ?.map((trip) => trip.toDomain())
                  .toList()
                  .sortTrips() ??
              [];

          return Right(DriverHomeEntities(trips: trips));
        } else {
          AppLogger.f("sdjfhkjdshfsbfulvsufbkjdsfl;sdf");
          return Left(
            ErrorHandler.handle(
              Failure(response.message ?? ResponseMessage.DEFAULT,
                  response.statusCode ?? ResponseCode.DEFAULT),
            ).failure,
          );
        }
      } catch (e) {
        AppLogger.f(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> updateTripRequestStatus(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _driverHomeRemoteDataSource.updateTripRequest(id);
        if (response.statusCode == ResponseCode.SUCCESS) {
          return Right(response);
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

  @override
  Future<Either<Failure, BaseResponse>> reportTrip(TripReportModel tripReportModel) async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await _driverHomeRemoteDataSource.reportTrip(tripReportModel);
        if (response.statusCode == ResponseCode.SUCCESS) {
          return Right(response);
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

  @override
  Future<Either<Failure, BaseResponse>> reportFault(FaultReportModel faultReportModel) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _driverHomeRemoteDataSource.reportFault(faultReportModel);
        if (response.statusCode == ResponseCode.SUCCESS) {
          return Right(response);
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

