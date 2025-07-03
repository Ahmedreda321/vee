import '../../../../core/di/dependency_injection.dart';
import '../data/datasources/mechanic_home_remot_data_source.dart';
import '../data/repositories/mechanic_home_repository_impl.dart';
import '../domain/usecases/get_maintenance_use_case.dart';

Future<void> mechanicHomeSetup() async {
  // Register the MechanicHomeRemoteDataSource
  getIt.registerLazySingleton<MechanicHomeRemotDataSource>(
    () => MechanicHomeRemotDataSource(getIt()),
  );

  // Register the MechanicHomeRepository
  getIt.registerLazySingleton<MechanicHomeRepositoryImpl>(
    () => MechanicHomeRepositoryImpl( getIt(),getIt()),
  );

  // Register the GetMaintenanceUseCase
  getIt.registerLazySingleton<GetMaintenanceUseCase>(
    () => GetMaintenanceUseCase(
      mechanicHomeRepositoryImpl: getIt(),
      
    ),
  );
}
