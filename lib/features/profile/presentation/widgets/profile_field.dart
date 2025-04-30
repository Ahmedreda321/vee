import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_padding.dart';

class ProfileField extends StatelessWidget {
  const ProfileField({
    super.key,
    required this.controller,
    this.type,
    required this.isEditing,
  });

  final TextEditingController controller;
  final TextInputType? type;
  final bool isEditing;
  @override
  Widget build(BuildContext context) {
    const border = BorderSide(color: AppColor.blue);
    return TextField(
      controller: controller,
      keyboardType: type,
      readOnly: !isEditing,
      style: AppTextStyles.profileFormText,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: AppPadding.profileFormPadding,
        enabledBorder: UnderlineInputBorder(
          borderSide: border,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: border,
        ),
      ),
    );
  }
}
