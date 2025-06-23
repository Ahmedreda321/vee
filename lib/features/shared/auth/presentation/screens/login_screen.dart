import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../data/models/login_request_body.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_format_screens.dart';
import '../widgets/login_email_and_password.dart';
import '../widgets/forgot_password.dart';
import '../widgets/login_bloc_listener.dart';
import '../widgets/screen_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: AuthFormatScreens(
        children: [
          const ScreenTitle(title: AppStrings.login),
          const EmailAndPassword(),
          ForgotPassword(
            onPressed: () {
              context.pushNamed(Routes.forgotPasswordScreen);
            },
          ),
          AuthButton(
            onPressed: () {
              validator(context);
            },
            title: AppStrings.login,
          ),
          const LoginBlocListener(),
        ],
      ),
    );
  }
}



void validator(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().login(
          LoginRequestBody(
            email: context.read<LoginCubit>().emailController.text,
            password: context.read<LoginCubit>().passwordController.text,
          ),
        );
  }
}
