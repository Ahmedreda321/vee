import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/app_circular_indicator.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../cubits/login_cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginError ||
          current is LoginSuccess ||
          current is LoginLoading,
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
                    child: const Text(AppStrings.ok,
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    onPressed: () => context.back(),
                  ),
                ],
              ),
            );
          },
          success: (loginEntity) {
            context.back();
            if (loginEntity.mustChangePassword) {
              context.pushNamed( Routes.resetPasswordScreen);
            } else {
              final businessUser = loginEntity.businessUser;
              if (businessUser != null) {
                if (businessUser.role == AppStrings.driver) {
                  context.pushReplacementNamed(
                       Routes.driverHomeScreen);
                } else {
                  context.pushReplacementNamed("");
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Error: User data is missing, please try again later')),
                );

              }
            }
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
