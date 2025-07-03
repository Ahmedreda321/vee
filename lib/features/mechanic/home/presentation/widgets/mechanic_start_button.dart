import 'package:flutter/material.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_size.dart';

class StartRepairButton extends StatelessWidget {
  final String status;
  final VoidCallback? onPressed;
  const StartRepairButton({
    super.key,
    required this.onPressed,
    required this.status,
  });

  String get buttonText {
    switch (status) {
      case AppStrings.pending:
        return AppStrings.start;
      case AppStrings.inProgress:
        return AppStrings.finish;
      case "Completed":
        return AppStrings.finished;
      default:
        return AppStrings.start;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: AppSize.homeCardButtonSize),
      onPressed: status == AppStrings.pending || status == AppStrings.inProgress ? onPressed : null,
      child: Text( buttonText,
        
          style: AppTextStyles.tripCardButton),
    );
  }
}
