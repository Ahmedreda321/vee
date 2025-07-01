import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class OnBoardingWelcome extends StatelessWidget {
  const OnBoardingWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.onBoardingWelcomeTo,
          style: AppTextStyles.onBordingHead,
        ),
        Text(AppConstants.appName,
            style: AppTextStyles.onBordingHead
                .copyWith(color: AppColor.primaryColor)),
      ],
    );
  }
}
