import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppCircularIndicator extends StatelessWidget {
  const AppCircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColor.primaryColor,
      strokeWidth: 2.0,
      
    );
  }
}

