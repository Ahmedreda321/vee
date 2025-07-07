import '../../../../core/di/dependency_injection.dart';
import '../data/datasources/reports_remot_data_source.dart';
import '../data/repositories/driver_reports_repository_impl.dart';
import '../domain/usecases/get_driver_reports_use_case.dart';

Future<void> driverReportsSetup() async {
  // Register the ReportsRemoteDataSource
  getIt.registerLazySingleton<ReportsRemotDataSource>(
    () => ReportsRemotDataSource(getIt()),
  );

  // Register the ReportsRepository
  getIt.registerLazySingleton<DriverReportsRepositoryImpl>(
    () => DriverReportsRepositoryImpl(
      getIt(),
      getIt(),
    ),
  );

  // Register the GetDriverReportsUseCase
  getIt.registerLazySingleton<GetDriverReportsUseCase>(
    () => GetDriverReportsUseCase(getIt()),
  );
}
