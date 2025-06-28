
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/app_circular_indicator.dart';
import '../cubit/driver_home_cubit.dart';
import 'custom_app_bar.dart';
import 'driver_home_listview.dart';

class TripLoding extends StatelessWidget {
  const TripLoding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Keep the current screen in background
        Builder(
          builder: (context) {
            // Get the previous loaded state
            final previousState = context.read<DriverHomeCubit>().state;
            return previousState.maybeWhen(
              loaded: (data) => Scaffold(
                appBar: CustomAppBar(
                  imageUrl:
                      "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                  onProfileButtonTap: () =>
                      context.pushNamed(Routes.profileScreen),
                  title: "${data.trips.length} ${AppStrings.trips}",
                  subtitle: AppStrings.upcomingTrips,
                  onNotificationTap: () =>
                      context.pushNamed(Routes.notificationScreen),
                ),
                body: DriverHomeListView(
                  trips: data.trips,
                ),
              ),
              orElse: () => const Scaffold(
                body: Center(
                  child: AppCircularIndicator(),
                ),
              ),
            );
          },
        ),
        // Loading overlay
        Container(
          color: Colors.black54,
          child: const Center(
            child: AppCircularIndicator(),
          ),
        ),
      ],
    );
  }
}
