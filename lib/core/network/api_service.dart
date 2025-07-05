import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:vee/features/driver/home/data/models/fault_report_model.dart';

import '../../features/driver/home/data/models/driver_home_response.dart';
import '../../features/driver/home/data/models/lcation_update_model.dart';
import '../../features/driver/home/data/models/trip_report_model.dart';
import '../../features/mechanic/home/data/models/finish_repair_model.dart';
import '../../features/mechanic/home/data/models/mechanic_home_response.dart';
import '../../features/mechanic/home/data/models/part_model.dart';
import '../../features/mechanic/home/data/models/start_repair_model.dart';
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

  // **************************************************************************
  // Trip Endpoints
  // **************************************************************************

  @POST(ApiConstants.tripReport)
  Future<BaseResponse> reportTrip(
    @Body() TripReportModel tripReportModel,
  );

  @POST(ApiConstants.faultReport)
  Future<BaseResponse> reportFault(
    @Body() FaultReportModel faultReportModel,
  );

  @POST(ApiConstants.tripLocation)
  Future<BaseResponse> updateTripLocation(
    @Body() LcationUpdateModel lcationUpdateModel,
  );

  // **************************************************************************
  // Mechanic Endpoints
  // **************************************************************************

  @GET(ApiConstants.maintenance)
  Future<MechanicHomeResponse> getMaintenance();

  @GET(ApiConstants.getParts)
  Future<List<PartModel>> getParts();

  @POST(ApiConstants.startRepair)
  Future<BaseResponse> startRepair(
    @Body() StartRepairModel startRepairModel,
  );

  @POST(ApiConstants.finishRepair)
  Future<BaseResponse> finishRepair(
    @Body() FinishRepairModel finishRepairModel,
  );
}
