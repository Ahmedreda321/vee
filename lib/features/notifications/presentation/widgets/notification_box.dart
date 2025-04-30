import 'package:flutter/material.dart';

import '../../../../core/extensions/sizedbox_extensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/app_size.dart';
import 'app_notification.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    super.key,
    required this.title,
    required this.notification,
    required this.notificationCount,
  });
  final String title;
  final AppNotification notification;
  final int notificationCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.notificationCardHeight,
      width: AppSize.notificationCardWidth,
      child: Card(
        child: Padding(
          padding: AppPadding.small,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.notificationBoxTitle),
              verticalSpace(AppSize.large),
              Expanded(
                child: ListView.builder(
                    itemCount: notificationCount,
                    itemBuilder: (context, index) => notification),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
