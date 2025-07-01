import '../../../../core/di/dependency_injection.dart';
import '../../../../core/network/network_info.dart';
import '../data/datasources/auth_remot_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/usecases/forgot_password_use_case.dart';
import '../domain/usecases/login_use_case.dart';

Future<void> authSetup() async {

  //******************************************************************************************************************* *//
  //? Auth Dependency Injection
  //******************************************************************************************************************* *//

  // Register the AuthRemotDataSource
  getIt.registerLazySingleton<AuthRemotDataSource>(
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

//******************************************************************************************************************* *//
//?  Login dependency injection
//******************************************************************************************************************* *//


  // Register the LoginUseCase
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt()),
  );

//******************************************************************************************************************* *//
//? Forgot Password dependency injection
//******************************************************************************************************************* *//

  // Register the ForgotPasswordUseCase
  getIt.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(getIt()),
  );

}
