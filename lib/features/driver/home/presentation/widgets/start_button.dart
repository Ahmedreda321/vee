import 'package:flutter/material.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_size.dart';

class StartButton extends StatelessWidget {
  final String status;
  final VoidCallback? onPressed;
  const StartButton({
    super.key,
    required this.onPressed,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: AppSize.homeCardButtonSize),
      onPressed: status == AppStrings.pending ? onPressed : null,
      child: Text(
          status == AppStrings.pending
              ? AppStrings.start
              : AppStrings.completed,
          style: AppTextStyles.tripCardButton),
    );
  }
}
