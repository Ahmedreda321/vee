import 'package:flutter/material.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/utils/app_border_radius.dart';
import '../../../../core/utils/app_margin.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppMargin.profileBackIcon,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: AppBorderRadius.mediumBorderRadius,
        boxShadow: AppShadows.secondaryShadow,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.back(),
      ),
    );
  }
}
