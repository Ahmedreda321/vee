import '../../../../core/di/dependency_injection.dart';
import '../data/datasources/mechanic_home_remot_data_source.dart';
import '../data/repositories/mechanic_home_repository_impl.dart';
import '../domain/usecases/finish_repair_use_case.dart';
import '../domain/usecases/get_maintenance_use_case.dart';
import '../domain/usecases/get_parts_use_case.dart';
import '../domain/usecases/start_repair_use_case.dart';

Future<void> mechanicHomeSetup() async {
  // Register the MechanicHomeRemoteDataSource
  getIt.registerLazySingleton<MechanicHomeRemotDataSource>(
    () => MechanicHomeRemotDataSource(getIt()),
  );

  // Register the MechanicHomeRepository
  getIt.registerLazySingleton<MechanicHomeRepositoryImpl>(
    () => MechanicHomeRepositoryImpl(getIt(), getIt()),
  );

  // Register the GetMaintenanceUseCase
  getIt.registerLazySingleton<GetMaintenanceUseCase>(
    () => GetMaintenanceUseCase(
      mechanicHomeRepositoryImpl: getIt(),
    ),
  );

  // Register the GetPartsUseCase
  getIt.registerLazySingleton<GetPartsUseCase>(
    () => GetPartsUseCase(
      mechanicHomeRepositoryImpl: getIt(),
    ),
  );

  // Register the StartRepairUseCase
  getIt.registerLazySingleton<StartRepairUseCase>(
    () => StartRepairUseCase(
      getIt(),
    ),
  );

  // Register the FinishRepairUseCase
  getIt.registerLazySingleton<FinishRepairUseCase>(
    () => FinishRepairUseCase(
      getIt(),
    ),
  );
}
