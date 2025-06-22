import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../cubits/login_cubit/login_cubit.dart';
import 'auth_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({
    super.key,
  });

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AuthFormField(
            label: AppStrings.userName,
            hintText: AppStrings.email,
            controller: loginCubit.emailController,
            isEmail: true,
          ),
          AuthFormField(
            label: AppStrings.password,
            hintText: AppStrings.password,
            controller: loginCubit.passwordController,
            isPassword: true,
          )
        ],
      ),
    );
  }
}
