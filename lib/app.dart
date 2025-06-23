import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';
import 'core/routing/app_router.dart';
import 'core/constants/app_constants.dart';
import 'core/utils/app_size.dart';

class Vee extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;
  const Vee({super.key, required this.appRouter, required this.initialRoute});

  @override
  Widget build(BuildContext context)  {
    return ScreenUtilInit(
      designSize: AppSize.designSize,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: initialRoute,
      ),
    );
  }
}
