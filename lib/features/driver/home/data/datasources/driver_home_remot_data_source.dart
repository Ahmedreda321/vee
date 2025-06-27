import '../../../../../core/models/base_data_source.dart';
import '../../../../../core/network/api_service.dart';
import '../models/driver_home_response.dart';

class DriverHomeRemoteDataSource {
  final ApiService _apiService;

  DriverHomeRemoteDataSource(this._apiService);
  Future<DriverHomeResponse> getDriverTrips() async {
    return await _apiService.getDriverTrips();
  }

  Future<BaseResponse> updateTripRequest(String id) async {
    return await _apiService.updateTripRequestStatus(id);
  }

}