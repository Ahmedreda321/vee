import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_shadows.dart';
import '../utils/app_border_radius.dart';
import '../utils/app_margin.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.child,
    this.padding,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.smallBorderRadius,
          boxShadow: AppShadows.primaryShadow,
          color: AppColor.white,
        ),
        margin: AppMargin.smallSymmetric,
        padding: padding,
        child: child);
  }
}
