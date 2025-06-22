import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/app_circular_indicator.dart';
import '../cubits/forgot_passwprd_cubit/forgot_password_cubit.dart';
import '../cubits/forgot_passwprd_cubit/forgot_password_state.dart';

class ForgotPasswordBlocListener extends StatelessWidget {
  const ForgotPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) =>
          current is Success || current is Error || current is Loading,
      listener: (context, state) {
        state.whenOrNull(
          error: (error) {
            context.back();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: Text(error),
                actions: [
                  TextButton(
                    child: const Text('OK',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            );
          },
          success: (data) {
            context.back();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: Text("${data.message}.\n please check your email"),
                actions: [
                  TextButton(
                    child: const Text('OK',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                      context.pushNamed(Routes.resetPasswordScreen);
                    },
                  ),
                ],
              ),
            );
          },
          loading: () {
            showDialog(
                context: context,
                builder: (_) => const Center(child: AppCircularIndicator()));
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
