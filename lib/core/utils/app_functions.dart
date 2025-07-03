import 'package:vee/core/constants/strings_constants.dart';
import 'package:vee/core/services/logger_service.dart';

import '../routing/routes.dart';
import 'app_shared_pref_consts.dart';
import 'app_shared_preferences.dart';

class AppFunctions {
  AppFunctions._();

  static Future<String> getInitialRoute() async {
    final token =
        await AppPreferences.getSecureData(AppSharedPrefConsts.userToken);
    final role =
        await AppPreferences().getData(AppSharedPrefConsts.userRole) ?? '';
AppLogger.i('Role: $role');
    if (token == null || token.isEmpty) {
      return Routes.onBoardingScreen;
    } else {
      if (role == AppStrings.driver) {
        return Routes.driverHomeScreen;
      } else if (role == AppStrings.mechanic) {
        return Routes.mechanicHomeScreen;
      } else {
        return Routes.onBoardingScreen;
      }
    }
  }
}
