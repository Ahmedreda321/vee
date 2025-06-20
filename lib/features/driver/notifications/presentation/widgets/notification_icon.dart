import 'package:flutter/material.dart';
import 'package:vee/core/utils/app_margin.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_shadows.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/app_size.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
    this.isPast = false,
  });

  final bool isPast;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: AppPadding.extraSmall,
        margin: AppMargin.onlyRightSmall,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isPast ? AppColor.grayColor : AppColor.white,
            boxShadow: AppShadows.primaryShadow),
        child: Icon(Icons.notifications_none_outlined,
            size: AppSize.notificationIconSize));
  }
}
