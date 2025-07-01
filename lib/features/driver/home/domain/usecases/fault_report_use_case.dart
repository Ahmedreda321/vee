import 'package:dartz/dartz.dart';

import 'package:vee/core/errors/failures.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../data/models/fault_report_model.dart';
import '../../data/repositories/driver_home_repository_impl.dart';

class FaultReportUseCase implements BaseUseCase <FaultReportModel, void> {
    final DriverHomeRepositoryImpl _driverHomeRepositoryImpl;

  FaultReportUseCase(this._driverHomeRepositoryImpl);

  @override
  Future<Either<Failure, void>> call(FaultReportModel input) {
    return _driverHomeRepositoryImpl.reportFault(input);
  }
}