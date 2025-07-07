import 'package:vee/core/network/api_service.dart';

import '../models/reports_respons_models.dart';

class ReportsRemotDataSource {
 final ApiService apiService;
  ReportsRemotDataSource(this.apiService);

  Future<List<DriverReportsBaseRespons>> getDriverReports(String driverId,String sort) async {
    return await apiService.getDriverReports(driverId,sort);
  }
}