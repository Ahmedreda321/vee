import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/features/shared/auth/presentation/widgets/forgot_password_email.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../data/models/forogt_password_request_body.dart';
import '../cubits/forgot_passwprd_cubit/forgot_password_cubit.dart';
import '../widgets/auth_desc.dart';
import '../widgets/auth_format_screens.dart';
import '../widgets/auth_button.dart';
import '../widgets/forgot_password_bloc_listener.dart';
import '../widgets/screen_title.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {


  void _submit() {
    if (context.read<ForgotPasswordCubit>().forgotPasswordFormKey.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().forgotPassword(
        ForgotPasswordRequestBody(
          email: context.read<ForgotPasswordCubit>().emailController.text,
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: AuthFormatScreens(
        children: [
          const ScreenTitle(title: AppStrings.forgotPassword),
          const AuthDesc(desc: AppStrings.forgotPasswordDesc),
          const ForgotPasswordEmail(),
          AuthButton(
            onPressed: _submit,
            title: AppStrings.sendEmail,
          ),
          const ForgotPasswordBlocListener(),
        ],
      ),
    );
  }
}
