import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:vee/core/network/endpoint_constants.dart';
import 'package:vee/features/shared/auth/data/models/login_response.dart';

import '../../features/shared/auth/data/models/forogt_password_request_body.dart';
import '../../features/shared/auth/data/models/login_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @POST(ApiConstants.forgotPassword)
  Future<String?> forgotPassword(
    @Body() ForgotPasswordRequestBody forgotPasswordRequestBody,
  );
}
