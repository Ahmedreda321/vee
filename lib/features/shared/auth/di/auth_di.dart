import '../../../../core/di/dependency_injection.dart';
import '../../../../core/network/network_info.dart';
import '../data/datasources/auth_remot_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/usecases/login_use_case.dart';
import '../presentation/cubits/login_cubit.dart';

Future<void> authSetup() async {

  // Register the AuthRemotDataSource
  getIt.registerLazySingleton<AuthRemotDataSource> (
    () => AuthRemotDataSource(getIt()),
  );

// Register the NetworkInfo 
getIt.registerLazySingleton<NetworkInfo>(
  () => NetworkInfo(getIt()),
);
  // Register the AuthRepository
  getIt.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(
     networkInfo: getIt(),
      authRemotDataSource: getIt(),
    ),
  );
  // Register the LoginUseCase
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt()),
  );

  // Register the LoginCubit
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt()),
  );
}
