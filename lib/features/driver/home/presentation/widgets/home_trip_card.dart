import 'package:flutter/material.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/widgets/app_container.dart';
import '../../../../../core/widgets/trip_card_info.dart';
import 'start_button.dart';

class HomeTripCard extends StatelessWidget {
  const HomeTripCard({
    super.key,
    required this.tripInfo,
    required this.vehicleInfo,
    required this.date,
    required this.time,
    required this.onPressed, 
    required this.status,
  });
  final String status;
  final TripCardInfo tripInfo, vehicleInfo;
  final String date, time;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: AppPadding.small,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tripInfo,
          vehicleInfo,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TripCardInfo(title: AppStrings.date, value: date),
            TripCardInfo(title: AppStrings.time, value: time),
          ]),
          StartButton(onPressed: onPressed, status: status),
        ],
      ),
    );
  }
}
