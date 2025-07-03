import '../../../../../core/network/api_service.dart';
import '../models/mechanic_home_response.dart';

class MechanicHomeRemotDataSource {
  final ApiService _apiService;
  MechanicHomeRemotDataSource(this._apiService);

  Future<MechanicHomeResponse> getMaintenance()async{
   return await _apiService.getMaintenance();
  } 
  
}