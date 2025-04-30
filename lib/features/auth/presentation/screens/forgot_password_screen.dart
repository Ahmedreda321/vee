import 'package:flutter/material.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/auth_desc.dart';
import '../widgets/auth_format_screens.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_form_field.dart';
import '../widgets/screen_title.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _autoValidate = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // All validations passed, navigate to code verification
      context.pushReplacementNamed(Routes.verifyCodeScreen);
    } else {
      setState(() => _autoValidate = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Form(
        key: _formKey,
        autovalidateMode:
            _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: AuthFormatScreens(
          children: [
            ScreenTitle(title: AppStrings.forgotPassword),
            AuthDesc(desc: AppStrings.forgotPasswordDesc),
            AuthFormField(
              controller: _emailController,
              label: AppStrings.email,
              hintText: AppStrings.emailAddress,
              isEmail: true,
            ),
            AuthButton(
              onPressed: _submit,
              title: AppStrings.sendCode,
            ),
          ],
        ),
      ),
    );
  }
}
