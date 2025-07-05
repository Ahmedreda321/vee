import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/features/driver/home/presentation/cubits/cubit/map_screen_cubit.dart';
import 'package:vee/features/mechanic/home/presentation/cubit/mechanic_home_cubit.dart';

import '../../features/driver/home/domain/entities/driver_home_entities.dart';
import '../../features/driver/home/presentation/cubits/driver_home_cubit/driver_home_cubit.dart';
import '../../features/driver/home/presentation/screens/map_view.dart';
import '../../features/mechanic/home/presentation/screens/mechanic_home_screen.dart';
import '../../features/shared/auth/presentation/cubits/forgot_passwprd_cubit/forgot_password_cubit.dart';
import '../../features/shared/auth/presentation/cubits/login_cubit/login_cubit.dart';
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
          create: (context) => LoginCubit(getIt()),
          child: const LoginScreen(),
        ));
      case Routes.forgotPasswordScreen:
        return _createRoute(BlocProvider(
          create: (context) => ForgotPasswordCubit(getIt()),
          child: const ForgotPasswordScreen(),
        ));
      case Routes.verifyCodeScreen:
        return _createRoute(const VerifyCodeScreen());
      case Routes.resetPasswordScreen:
        return _createRoute(const ResetPasswordScreen());
      case Routes.driverHomeScreen:
        return _createRoute(BlocProvider(
          create: (context) =>
              DriverHomeCubit(getIt(), getIt())..getDriverHomeData(),
          child: const DriverHomeScreen(),
        ));
      case Routes.mapScreen:
        if (settings.arguments is TripEntity) {
          final trip = settings.arguments as TripEntity;
          return _createRoute(BlocProvider(
            create: (context) => MapScreenCubit(getIt(), getIt()),
            child: MapView(trip: trip),
          ));
        }
        else {
        return _createRoute(const NotFoundRouteScreen());
      }
      case Routes.profileScreen:
        return _createRoute(
          BlocProvider<ProfileCubit>(
            create: (_) => ProfileCubit(),
            child: const ProfileScreen(),
          ),
        );

      case Routes.notificationScreen:
        return _createRoute(const NotificationScreen());
      case Routes.mechanicHomeScreen:
        return _createRoute(BlocProvider(
          create: (context) => MechanicHomeCubit(getIt(), getIt(), getIt(), getIt())..getMechanicHomeData(),
          child: const MechanicHomeScreen(),
        ));

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
