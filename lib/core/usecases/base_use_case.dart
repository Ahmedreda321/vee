// lib/core/base_use_case.dart
import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

abstract class BaseUseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input input);
}

// noParams
class NoParams {}