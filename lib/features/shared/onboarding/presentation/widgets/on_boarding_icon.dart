import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_assets.dart';

class OnBoardingIcon extends StatelessWidget {
  const OnBoardingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.assetsImagesLogo,
    
        width: 170.w); 
  }
}
