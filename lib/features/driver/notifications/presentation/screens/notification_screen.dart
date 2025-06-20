import 'package:flutter/material.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../widgets/app_notification.dart';
import '../widgets/notification_box.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.white70,
        appBar: AppBar(
          title:
              Text(AppStrings.notifications, style: AppTextStyles.screenTitle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            NotificationBox(
              title: AppStrings.newTask,
              notification: AppNotification(
                isPast: false,
              ),
              notificationCount: 5,
            ),
            NotificationBox(
              title: AppStrings.pastTasks,
              notification: AppNotification(
                isPast: true,
              ),
              notificationCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
