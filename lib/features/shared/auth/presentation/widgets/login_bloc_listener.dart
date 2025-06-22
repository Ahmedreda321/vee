import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/routing/routes.dart';
import '../cubits/login_cubit.dart';
import '../cubits/login_state.dart';

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
                    child: const Text('OK',
                        style:TextStyle(
                          color: Colors.black,
                        )),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            );
          },
          success: (loginEntity) {
            context.back();
             if (loginEntity.mustChangePassword) {
    Navigator.pushNamed(context, Routes.resetPasswordScreen);
  } else {
    final businessUser = loginEntity.businessUser;
    if (businessUser != null) {
      if (businessUser.role == 'driver') {
        Navigator.pushReplacementNamed(context, Routes.driverHomeScreen);
      } else {
        Navigator.pushReplacementNamed(context, "");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Business user data is missing')),
      );
    }
  }
          },
          loading: () {
            showDialog(
                context: context,
                builder: (_) =>
                    const Center(child: CircularProgressIndicator()));
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
