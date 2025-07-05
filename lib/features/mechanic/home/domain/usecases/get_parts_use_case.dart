import 'package:dartz/dartz.dart';
import 'package:vee/core/errors/failures.dart';
import 'package:vee/core/usecases/base_use_case.dart';
import 'package:vee/features/mechanic/home/data/repositories/mechanic_home_repository_impl.dart';

import '../../data/models/part_model.dart';

class GetPartsUseCase implements BaseUseCase<NoParams, List<PartModel>> {
  final MechanicHomeRepositoryImpl mechanicHomeRepositoryImpl;

  GetPartsUseCase({required this.mechanicHomeRepositoryImpl});
  @override
  Future<Either<Failure, List<PartModel>>> call(NoParams input) {
    return mechanicHomeRepositoryImpl.getParts();
  }
}
