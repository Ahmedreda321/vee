import 'package:flutter/material.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/widgets/app_container.dart';
import '../../../../../core/widgets/trip_card_info.dart';
import 'notification_icon.dart';

class AppNotification extends StatelessWidget {
  final bool isPast;

  const AppNotification({
    super.key,
    required this.isPast,
  });
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: AppPadding.small,
      child: Row(children: [
        NotificationIcon(isPast: isPast),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TripCardInfo(
                  title: AppStrings.vehicle,
                  value: "Toyota Corolla - White (-6gkgkgjugjh4)"),
              TripCardInfo(title: AppStrings.trip, value: "From Alex → Cairo"),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TripCardInfo(title: AppStrings.date, value: "10/10/2022"),
                TripCardInfo(title: AppStrings.time, value: "10:00 AM")
              ])
            ],
          ),
        ),
      ]),
    );
  }
}
