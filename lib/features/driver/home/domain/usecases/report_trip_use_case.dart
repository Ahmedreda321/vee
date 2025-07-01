import 'package:dartz/dartz.dart';

import 'package:vee/core/errors/failures.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../data/models/trip_report_model.dart';
import '../../data/repositories/driver_home_repository_impl.dart';

class ReportTripUseCase implements BaseUseCase<TripReportModel, void> {
  final DriverHomeRepositoryImpl _driverHomeRepositoryImpl;

  ReportTripUseCase(this._driverHomeRepositoryImpl);

  @override
  Future<Either<Failure, void>> call(TripReportModel input) {
    return _driverHomeRepositoryImpl.reportTrip(input);
  }
}
