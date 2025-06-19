import 'package:flutter/material.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_size.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.black,
        minimumSize: AppSize.authButtonSize,
      ),
      onPressed: onPressed,
      child: Text(
        AppStrings.onBoardingGetStarted,
        style: AppTextStyles.onBordingButton,
      ),
    );
  }
}
