import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/shared/auth/presentation/cubits/login_cubit.dart';
import '../../features/shared/auth/presentation/screens/reset_password_screen.dart';
import '../../features/shared/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/shared/auth/presentation/screens/login_screen.dart';
import '../../features/shared/auth/presentation/screens/verify_code_screen.dart';
import '../../features/driver/home/presentation/screens/driver_home_screen.dart';
import '../../features/driver/notifications/presentation/screens/notification_screen.dart';
import '../../features/shared/profile/presentation/cubit/profile_cubit.dart';
import '../../features/shared/profile/presentation/screens/profile_screen.dart';
import '../di/dependency_injection.dart';
import '../routing/routes.dart';
import '../../features/shared/onboarding/presentation/screens/onboarding_screen.dart';
import '../screens/not_found_route_screen.dart';
import '../utils/app_duration.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return _createRoute(const OnboardingScreen());
      case Routes.loginScreen:
        return _createRoute(BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ));
      case Routes.forgotPasswordScreen:
        return _createRoute(const ForgotPasswordScreen());
      case Routes.verifyCodeScreen:
        return _createRoute(const VerifyCodeScreen());
      case Routes.resetPasswordScreen:
        return _createRoute(const ResetPasswordScreen());
      case Routes.driverHomeScreen:
        return _createRoute(const DriverHomeScreen());
      case Routes.profileScreen:
        return _createRoute(
          BlocProvider<ProfileCubit>(
            create: (_) => ProfileCubit(),
            child: const ProfileScreen(),
          ),
        );

      case Routes.notificationScreen:
        return _createRoute(const NotificationScreen());

      default:
        return _createRoute(const NotFoundRouteScreen());
    }
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: AppDuration.transitionDuration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
