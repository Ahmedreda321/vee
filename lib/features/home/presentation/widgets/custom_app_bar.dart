import 'package:flutter/material.dart';
import 'package:vee/core/utils/app_margin.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/utils/app_border_radius.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/app_size.dart';
import 'notification_button.dart';
import 'profile_avatar.dart';
import 'up_coming_trips.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onNotificationTap;
  final VoidCallback onProfileButtonTap;

  const CustomAppBar({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onNotificationTap,
    required this.onProfileButtonTap,
  });
  @override
  Size get preferredSize => AppSize.homeAppBarSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.large,
      margin: AppMargin.onlyBottomSmall,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          bottomLeft: AppBorderRadius.extraLarge,
          bottomRight: AppBorderRadius.extraLarge,
        ),
        boxShadow: AppShadows.primaryShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile Button
          ProfileAvatar(imageUrl: imageUrl, onTap: onProfileButtonTap),

          // Center Text Info
          UpComingTrips(subtitle: subtitle, title: title),

          // Notification Button
          NotificationButton(
            onTap: onNotificationTap,
            notificationCount: 50,
          )
        ],
      ),
    );
  }
}
