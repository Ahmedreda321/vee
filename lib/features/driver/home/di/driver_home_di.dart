import '../../../../core/di/dependency_injection.dart';
import '../data/datasources/driver_home_remot_data_source.dart';
import '../data/repositories/driver_home_repository_impl.dart';
import '../domain/usecases/get_trips_ues_case.dart';

Future <void> driverHomeSetup() async {
  // Register the DriverHomeRemoteDataSource
  getIt.registerLazySingleton<DriverHomeRemoteDataSource>(
    () => DriverHomeRemoteDataSource(getIt()),
  );

  // Register the DriverHomeRepository
  getIt.registerLazySingleton<DriverHomeRepositoryImpl>(
    () => DriverHomeRepositoryImpl(
      networkInfo: getIt(),
      driverHomeRemoteDataSource: getIt(),
    ),
  );

  // Register the GetTripsUseCase
  getIt.registerLazySingleton<GetTripsUseCase>(
    () => GetTripsUseCase(getIt()),
  );


}