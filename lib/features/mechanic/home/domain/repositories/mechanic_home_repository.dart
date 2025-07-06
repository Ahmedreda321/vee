import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/models/base_data_source.dart';
import '../../data/models/finish_repair_model.dart';
import '../../data/models/part_model.dart';
import '../../data/models/start_repair_model.dart';
import '../entities/maintenance_entitied.dart';

abstract class MechanicHomeRepository {
  Future<Either<Failure, MechanicHomeEntities>> getMaintenance();
  Future<Either<Failure, List<PartModel>>> getParts();
  Future<Either<Failure, BaseResponse>> startRepair(StartRepairModel startRepairModel);
  Future<Either<Failure, BaseResponse>> finishRepair(FinishRepairModel finishRepairModel);
}