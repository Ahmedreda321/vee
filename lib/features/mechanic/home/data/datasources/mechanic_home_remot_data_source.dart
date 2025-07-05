import '../../../../../core/models/base_data_source.dart';
import '../../../../../core/network/api_service.dart';
import '../models/finish_repair_model.dart';
import '../models/mechanic_home_response.dart';
import '../models/part_model.dart';
import '../models/start_repair_model.dart';

class MechanicHomeRemotDataSource {
  final ApiService _apiService;
  MechanicHomeRemotDataSource(this._apiService);

  Future<MechanicHomeResponse> getMaintenance()async{
   return await _apiService.getMaintenance();
  } 
  Future<List<PartModel>> getParts()async{
   return await _apiService.getParts();
  }
  Future<BaseResponse> startRepair(StartRepairModel startRepairModel)async{
   return await _apiService.startRepair(startRepairModel);
  }
  Future<BaseResponse> finishRepair(FinishRepairModel finishRepairModel)async{
   return await _apiService.finishRepair(finishRepairModel);
  }
}