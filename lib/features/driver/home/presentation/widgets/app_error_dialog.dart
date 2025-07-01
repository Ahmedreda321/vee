import 'package:flutter/material.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/theme/app_colors.dart';

void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Something wrong'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              dialogContext.back();
            },
            child: const Text('ok', style: TextStyle(color: AppColor.black)),
          ),
        ],
      );
    },
  );
}
