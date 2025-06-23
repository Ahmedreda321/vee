import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../cubits/forgot_passwprd_cubit/forgot_password_cubit.dart';
import 'auth_form_field.dart';

class ForgotPasswordEmail extends StatefulWidget {
  const ForgotPasswordEmail({super.key});

  @override
  State<ForgotPasswordEmail> createState() => _ForgotPasswordEmailState();

}

class _ForgotPasswordEmailState extends State<ForgotPasswordEmail> {

  @override
  Widget build(BuildContext context) {
    final forgotPasswordCubit = context.read<ForgotPasswordCubit>();
    return Form(
      key: context.read<ForgotPasswordCubit>().forgotPasswordFormKey,
      child: AuthFormField(
              controller: forgotPasswordCubit.emailController,
              label: AppStrings.email,
              hintText: AppStrings.emailAddress,
              isEmail: true,
            ),
    );
  }
}