import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';
import 'package:vee/core/extensions/sizedbox_extensions.dart';
import 'package:vee/core/widgets/app_circular_indicator.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/widgets/trip_card_info.dart';
import '../../domain/entities/driver_home_entities.dart';
import '../cubit/driver_home_cubit.dart';
import '../cubit/driver_home_state.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/home_trip_card.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<DriverHomeCubit, DriverHomeState>(
        buildWhen: (previous, current) =>
            current is Loaded || current is Error || current is Loading,
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Scaffold(
              body: Center(
                child: AppCircularIndicator(),
              ),
            ),
            orElse: () => const SizedBox.shrink(),
            error: (message) => Scaffold(
              body: Center(
                child: Text(message),
              ),
            ),
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
                body: DriverHomeListViwe(
                  trips: data.trips,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DriverHomeListViwe extends StatelessWidget {
  final List <TripEntity> trips;
  const DriverHomeListViwe({
    super.key,
    required this.trips,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.small,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              AppStrings.trips,
              style: AppTextStyles.homeScreenListTile,
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(10)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final trip = trips[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: HomeTripCard(
                    onPressed: trip.status == "Pending" ? () {} : null,
                    tripInfo: TripCardInfo(
                      title: AppStrings.trip,
                      value: "From Alex → ${trip.destination}",
                    ),
                    vehicleInfo: TripCardInfo(
                      title: AppStrings.vehicle,
                      value: "${trip.vehicle.vehicleModel.brand.name} - (${trip.vehicle.palletNumber})",
                    ),
                    date: trip.date,
                    time: trip.time,
                  ),
                );
              },
              childCount: trips.length,
            ),
          ),
        ],
      ),
    );
  }
}
