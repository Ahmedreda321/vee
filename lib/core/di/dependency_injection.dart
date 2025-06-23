
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../network/api_service.dart';
import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {

  //Dio instance
  Dio dio = await DioFactory.getDio();
  // ApiService instance
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
// Register the InternetConnectionChecker
  getIt.registerLazySingleton<InternetConnectionChecker>(
  () => InternetConnectionChecker.createInstance(),
);


}