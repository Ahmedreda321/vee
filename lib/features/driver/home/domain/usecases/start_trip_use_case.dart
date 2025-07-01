import 'package:dartz/dartz.dart';

import 'package:vee/core/errors/failures.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../data/repositories/driver_home_repository_impl.dart';

class StartTripUseCase implements BaseUseCase <String , void> {
   final DriverHomeRepositoryImpl _repository;
    StartTripUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(String input) async {
    return await _repository.updateTripRequestStatus(input);
  }

}