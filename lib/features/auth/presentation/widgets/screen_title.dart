import 'package:flutter/material.dart';
import 'package:vee/core/theme/app_text_styles.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: AppTextStyles.authScreenTitle);
  }
}
