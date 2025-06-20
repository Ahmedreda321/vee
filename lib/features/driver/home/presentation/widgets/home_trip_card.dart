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
  });
  final TripCardInfo tripInfo, vehicleInfo;
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
            TripCardInfo(title: AppStrings.date, value: "12/12/2022"),
            TripCardInfo(title: AppStrings.time, value: "12:00"),
          ]),
          StartButton(),
        ],
      ),
    );
  }
}
