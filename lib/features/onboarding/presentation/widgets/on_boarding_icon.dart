import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/app_size.dart';

class OnBoardingIcon extends StatelessWidget {
  const OnBoardingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.assetsSvgsOnBoradingIcon,
      width: AppSize.onBoardingIconSize.w,
      height: AppSize.onBoardingIconSize.h,
    );
  }
}
