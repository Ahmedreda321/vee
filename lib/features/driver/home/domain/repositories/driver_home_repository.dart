import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/models/base_data_source.dart';
import '../../data/models/fault_report_model.dart';
import '../../data/models/trip_report_model.dart';
import '../entities/driver_home_entities.dart';

abstract class DriverHomeRepository {
  Future<Either<Failure, DriverHomeEntities>> getDriverHomeData();
  Future<Either<Failure, BaseResponse>> updateTripRequestStatus(String id);
  Future<Either<Failure, BaseResponse>> reportTrip(TripReportModel tripReportModel);
  Future<Either<Failure, BaseResponse>> reportFault(FaultReportModel faultReportModel);
}