

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/extensions/sizedbox_extensions.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/widgets/trip_card_info.dart';
import '../../domain/entities/driver_home_entities.dart';
import 'home_trip_card.dart';

class DriverHomeListView extends StatelessWidget {
  final List <TripEntity> trips;
  const DriverHomeListView({
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
                    status: trip.status,
                    onPressed: (){},
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
