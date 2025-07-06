
import 'package:dartz/dartz.dart';

import 'package:vee/core/errors/failures.dart';

import '../../../../../core/models/base_data_source.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../data/models/start_repair_model.dart';
import '../../data/repositories/mechanic_home_repository_impl.dart';

class StartRepairUseCase implements BaseUseCase <StartRepairModel, BaseResponse> {
    final MechanicHomeRepositoryImpl mechanicHomeRepositoryImpl;

  StartRepairUseCase(this.mechanicHomeRepositoryImpl);

  @override
  Future<Either<Failure, BaseResponse>> call(StartRepairModel input) {
    return mechanicHomeRepositoryImpl.startRepair(input);
  }
}