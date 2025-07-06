import 'package:dartz/dartz.dart';

import 'package:vee/core/errors/failures.dart';

import '../../../../../core/models/base_data_source.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../data/models/finish_repair_model.dart';
import '../../data/repositories/mechanic_home_repository_impl.dart';

class FinishRepairUseCase implements BaseUseCase <FinishRepairModel, BaseResponse> {
  final MechanicHomeRepositoryImpl mechanicHomeRepositoryImpl;
  FinishRepairUseCase(this.mechanicHomeRepositoryImpl);
  @override
  Future<Either<Failure, BaseResponse>> call(FinishRepairModel input) {
    return mechanicHomeRepositoryImpl.finishRepair(input);
  }
}