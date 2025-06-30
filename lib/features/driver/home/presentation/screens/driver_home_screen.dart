import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/app_circular_indicator.dart';
import '../cubit/driver_home_cubit.dart';
import '../cubit/driver_home_state.dart';
import '../widgets/app_error_dialog.dart';
import '../widgets/driver_home_loaded.dart';
import '../widgets/trip_loding.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<DriverHomeCubit, DriverHomeState>(
        listener: (context, state) {
          state.maybeWhen(
            tripError: (message) {
              showErrorDialog(context, message);
            },
            tripLoaded: (trip) {
              context.pushReplacementNamed(
                Routes.mapScreen,
                arguments: trip,
              );
            },
            unauthorized: () {
              context.pushReplacementNamed(Routes.loginScreen);
            },
            orElse: () {},
          );
        },
        buildWhen: (previous, current) =>
            current is Loaded ||
            current is Error ||
            current is Loading ||
            current is TripLoading,
        builder: (context, state) {
          return state.maybeWhen(
            // Handle the case when the state is not recognized
            orElse: () => const SizedBox.shrink(),
            // Show loading indicator while fetching data
            loading: () => const Scaffold(
              body: Center(
                child: AppCircularIndicator(),
              ),
            ),
            // Show error message if fetching data fails
            error: (message) => Scaffold(
              body: Center(
                child: Text(message),
              ),
            ),
            // Show the list of trips when data is successfully loaded
            loaded: (data) {
              return DriverHomeLoaded(
                data: data,
                state: state,
              );
            },
            tripLoding: () => const TripLoding(),
          );
        },
      ),
    );
  }
}
