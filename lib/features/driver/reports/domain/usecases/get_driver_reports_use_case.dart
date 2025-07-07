import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../data/repositories/driver_reports_repository_impl.dart';
import '../entities/driver_reports_entites.dart';

class GetDriverReportsUseCase
    implements BaseUseCase<NoParams, List<DriverReportsEntites>> {
  final DriverReportsRepositoryImpl driverReportsRepositoryImpl;

  GetDriverReportsUseCase(this.driverReportsRepositoryImpl);
  @override
  Future<Either<Failure, List<DriverReportsEntites>>> call(NoParams input) {
    return driverReportsRepositoryImpl.getDriverReports();
  }
}
