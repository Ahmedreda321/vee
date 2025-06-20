import 'package:flutter/material.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_desc.dart';
import '../widgets/auth_form_field.dart';
import '../widgets/auth_format_screens.dart';
import '../widgets/screen_title.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthFormatScreens(
      children: [
        const ScreenTitle(
          title: AppStrings.resetPassword,
        ),
        const AuthDesc(desc: AppStrings.resetPasswordDesc),
        AuthFormField(
          controller: TextEditingController(),
          isPassword: true,
          label: AppStrings.newPassword,
          hintText: AppStrings.newPassword,
        ),
        AuthFormField(
          controller: TextEditingController(),
          isPassword: true,
          label: AppStrings.confirmPassword,
          hintText: AppStrings.confirmPassword,
        ),
        AuthButton(
          onPressed: () {
            context.back();
          },
          title: AppStrings.resetPassword,
        ),
      ],
    );
  }
}
