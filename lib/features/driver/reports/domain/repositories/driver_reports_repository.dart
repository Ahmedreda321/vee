import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/driver_reports_entites.dart';

abstract class DriverReportsRepository {
  Future<Either<Failure,List< DriverReportsEntites>>> getDriverReports();
}