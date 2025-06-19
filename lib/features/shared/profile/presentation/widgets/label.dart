import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_padding.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.profileFormLabelPadding,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: AppTextStyles.profileFormLabel,
        ),
      ),
    );
  }
}
