
// import '../../../../../core/utils/app_shared_pref_consts.dart';
// import '../../../../../core/utils/app_shared_preferences.dart';
// import '../models/driver_home_response.dart';

// class DriverHomeLocalDataSource {
//   final AppPreferences _appPreferences;
//   DriverHomeLocalDataSource(this._appPreferences);

//   Future<void> saveDriverHomeData(DriverHomeResponse data) async{
//     await _appPreferences.saveModels(AppSharedPrefConsts.driverHomeData, data.trips.);
//   }

//   Future<DriverHomeResponse?> getDriverHomeData() async {
//     final data = await _appPreferences.getData(AppSharedPrefConsts.driverHomeData);
//     if (data != null) {
//       return DriverHomeResponse.fromJson(data);
//     }
//     return null;
//   }


// }