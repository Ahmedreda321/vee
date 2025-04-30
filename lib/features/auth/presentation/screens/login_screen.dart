import 'package:flutter/material.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_form_field.dart';
import '../widgets/auth_format_screens.dart';
import '../widgets/forgot_password.dart';
import '../widgets/screen_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _autoValidate = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.pushNamed(Routes.homeScreen);
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
            ScreenTitle(title: AppStrings.login),
            AuthFormField(
              label: AppStrings.userName,
              hintText: AppStrings.email,
              controller: _emailController,
              isEmail: true,
            ),
            AuthFormField(
              label: AppStrings.password,
              hintText: AppStrings.password,
              controller: _passwordController,
              isPassword: true,
            ),
            ForgotPassword(
              onPressed: () {
                context.pushNamed(Routes.forgotPasswordScreen);
              },
            ),
            AuthButton(
              onPressed: _submit,
              title: AppStrings.login,
            ),
          ],
        ),
      ),
    );
  }
}
