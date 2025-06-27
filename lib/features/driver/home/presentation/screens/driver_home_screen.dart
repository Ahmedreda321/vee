import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/services/maps_services.dart';
import '../../../../../core/widgets/app_circular_indicator.dart';
import '../cubit/driver_home_cubit.dart';
import '../cubit/driver_home_state.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/driver_home_listview.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<DriverHomeCubit, DriverHomeState>(
        buildWhen: (previous, current) =>
            current is Loaded ||
            current is Error ||
            current is Loading ||
            current is TripLoading ||
            current is TripLoaded ||
            current is TripError,
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
              return Scaffold(
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
              );
            },
            tripLoding: () => const Scaffold(
              body: Center(
                child: AppCircularIndicator(),
              ),
            ),
            tripLoaded: (trip) {
              return MapScreen(
                fromLat: trip.pickupLocationLatitude,
                fromLng: trip.pickupLocationLongitude,
                toLat: trip.destinationLatitude,
                toLng: trip.destinationLongitude,
              );
            },
            tripError: (message) => Scaffold(
              body: Center(
                child: Text(message),
              ),
            ),
          );
        },
      ),
    );
  }
}
