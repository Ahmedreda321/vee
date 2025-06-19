import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_shadows.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/app_size.dart';

class NotificationButton extends StatelessWidget {
  final VoidCallback onTap;
  final int notificationCount;

  const NotificationButton({
    super.key,
    required this.onTap,
    this.notificationCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.white,
            boxShadow: AppShadows.secondaryShadow),
        padding: AppPadding.small,
        child: Badge(
          isLabelVisible: notificationCount > 0,
          label: notificationCount > 9
              ? const Text('9+')
              : Text(
                  notificationCount.toString(),
                ),
          alignment: Alignment.topRight,
          backgroundColor: AppColor.red,
          child: Icon(Icons.notifications_none,
              size: AppSize.homeAppBarNotificationSize),
        ),
      ),
    );
  }
}
