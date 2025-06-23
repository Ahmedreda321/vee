import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/driver_home_entities.dart';

abstract class DriverHomeRepository {
  Future<Either<Failure, DriverHomeEntities>> getDriverHomeData();
}