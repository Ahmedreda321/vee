import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_shadows.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/app_size.dart';

class NotificationButton extends StatelessWidget {
  final VoidCallback onTap;

  const NotificationButton({
    super.key,
    required this.onTap,
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
        child: Icon(Icons.receipt_long_rounded,
            
            size: AppSize.homeAppBarNotificationSize),
      ),
    );
  }
}
