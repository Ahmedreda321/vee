import 'package:dartz/dartz.dart';
import 'package:vee/core/errors/failures.dart';

import '../entities/maintenance_entitied.dart';

abstract class MechanicHomeRepository {
  Future<Either<Failure, MechanicHomeEntities>> getMaintenance();
}