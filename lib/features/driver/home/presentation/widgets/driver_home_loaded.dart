
import 'package:flutter/material.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/app_circular_indicator.dart';
import '../../domain/entities/driver_home_entities.dart';
import '../cubit/driver_home_state.dart';
import 'custom_app_bar.dart';
import 'driver_home_listview.dart';

class DriverHomeLoaded extends StatelessWidget {
  final DriverHomeEntities data;
  final DriverHomeState state;
  const DriverHomeLoaded({
    super.key, required this.data, required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
        // Show loading overlay when starting trip
        if (state is TripLoading)
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
