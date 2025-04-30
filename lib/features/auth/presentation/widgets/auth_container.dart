import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_border_radius.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/app_size.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({
    super.key,
    required this.children,
  });
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.medium,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: AppBorderRadius.authContainerRadius,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: AppSize.extraLarge,
          children: children,
        ),
      ),
    );
  }
}
