import '../../../../../core/network/api_service.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';

class AuthRemotDataSource {
  final ApiService _apiService;
  AuthRemotDataSource(this._apiService);
  Future<LoginResponse> login(LoginRequestBody loginRequestBody) async {
   
      return await _apiService.login(loginRequestBody);
 
  }
}
