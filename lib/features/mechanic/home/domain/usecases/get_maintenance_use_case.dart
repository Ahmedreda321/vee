// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import 'package:vee/core/errors/failures.dart';
import 'package:vee/features/mechanic/home/data/repositories/mechanic_home_repository_impl.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../entities/maintenance_entitied.dart';

class GetMaintenanceUseCase
    implements BaseUseCase<NoParams, MechanicHomeEntities> {
  final MechanicHomeRepositoryImpl mechanicHomeRepositoryImpl;
  GetMaintenanceUseCase({
    required this.mechanicHomeRepositoryImpl,
  });
  @override
  Future<Either<Failure, MechanicHomeEntities>> call(NoParams input) {
    return mechanicHomeRepositoryImpl.getMaintenance();
  }
}
