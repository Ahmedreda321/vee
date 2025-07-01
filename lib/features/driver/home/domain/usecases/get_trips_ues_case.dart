import 'package:dartz/dartz.dart';
import 'package:vee/core/errors/failures.dart';
import 'package:vee/core/usecases/base_use_case.dart';
import 'package:vee/features/driver/home/data/repositories/driver_home_repository_impl.dart';
import 'package:vee/features/driver/home/domain/entities/driver_home_entities.dart';

class GetTripsUseCase implements BaseUseCase <NoParams, DriverHomeEntities> {
  final DriverHomeRepositoryImpl _driverHomeRepositoryImpl;
  GetTripsUseCase(this._driverHomeRepositoryImpl);
  @override
  Future<Either<Failure, DriverHomeEntities>> call(NoParams input) {
    return _driverHomeRepositoryImpl.getDriverHomeData();
  }
}

