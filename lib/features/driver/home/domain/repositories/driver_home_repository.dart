import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/models/base_data_source.dart';
import '../entities/driver_home_entities.dart';

abstract class DriverHomeRepository {
  Future<Either<Failure, DriverHomeEntities>> getDriverHomeData();
  Future<Either<Failure, BaseResponse>> updateTripRequestStatus(String id);
}