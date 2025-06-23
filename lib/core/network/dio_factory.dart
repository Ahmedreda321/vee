import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/app_shared_pref_consts.dart';
import '../utils/app_shared_preferences.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dio;

  static Future<Dio> getDio() async {
    Duration timeout = const Duration(seconds: 30);
    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      interceptor();
      addHeaders();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void interceptor() {
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      compact: false,
    ));
  }

  static void addHeaders() async {
    _dio!.options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization":
          "Bearer ${await AppPreferences.getSecureData(AppSharedPrefConsts.userToken)}"
    });
  }
  static void refreshHeadersAfterLogin(String token) {
    _dio!.options.headers['Authorization'] = "Bearer $token";
  }
}
