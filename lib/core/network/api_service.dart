import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/driver/home/data/models/driver_home_response.dart';
import '../../features/shared/auth/data/models/forogt_password_request_body.dart';
import '../../features/shared/auth/data/models/login_request_body.dart';
import '../../features/shared/auth/data/models/login_response.dart';
import '../models/base_data_source.dart';
import 'endpoint_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

// **************************************************************************
// Auth Endpoints
// **************************************************************************

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @POST(ApiConstants.forgotPassword)
  Future<String?> forgotPassword(
    @Body() ForgotPasswordRequestBody forgotPasswordRequestBody,
  );

// **************************************************************************
// Driver Home Endpoints
// **************************************************************************
  @GET(ApiConstants.driverTrips)
  Future<DriverHomeResponse> getDriverTrips();

  @PATCH(ApiConstants.updateTripRequest)
  Future<BaseResponse> updateTripRequestStatus(
    @Path('id') String id,
  );
}
