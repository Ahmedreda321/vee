import '../../../../../core/models/base_data_source.dart';
import '../../../../../core/network/api_service.dart';
import '../models/driver_home_response.dart';
import '../models/fault_report_model.dart';
import '../models/trip_report_model.dart';

class DriverHomeRemoteDataSource {
  final ApiService _apiService;

  DriverHomeRemoteDataSource(this._apiService);
  Future<DriverHomeResponse> getDriverTrips() async {
    return await _apiService.getDriverTrips();
  }

  Future<BaseResponse> updateTripRequest(String id) async {
    return await _apiService.updateTripRequestStatus(id);
  }

  Future<BaseResponse> reportTrip(TripReportModel tripReportModel) async {
    return await _apiService.reportTrip(tripReportModel);
  }

  Future<BaseResponse> reportFault(FaultReportModel faultReportModel) async {
    return await _apiService.reportFault(faultReportModel);
  }

}