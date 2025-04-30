import 'package:flutter/material.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../../../core/theme/app_text_styles.dart';

class OnBoardingDesc extends StatelessWidget {
  const OnBoardingDesc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.onBoardingDescription,
      style: AppTextStyles.onBordingDesc,
      maxLines: 3,
      textAlign: TextAlign.center,
    );
  }
}
