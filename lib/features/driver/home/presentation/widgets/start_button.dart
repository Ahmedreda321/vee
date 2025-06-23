import 'package:flutter/material.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_size.dart';

class StartButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const StartButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: AppSize.homeCardButtonSize),
      onPressed: onPressed,
      child: Text(AppStrings.start, style: AppTextStyles.tripCardButton),
    );
  }
}
