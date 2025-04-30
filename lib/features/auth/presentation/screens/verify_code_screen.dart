import 'package:flutter/material.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_format_screens.dart';
import '../widgets/otp_field.dart';
import '../widgets/screen_title.dart';
import '../widgets/send_code_again.dart';
import '../widgets/we_send_code.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthFormatScreens(children: [
      ScreenTitle(title: AppStrings.checkYourEmail),
      WeSendCode(
        email: "blake@email.com",
      ),
      OtpField(),
      SendCodeAgain(onResend: () {}),
      AuthButton(
        title: AppStrings.verify,
        onPressed: () {
          context.pushReplacementNamed(Routes.resetPasswordScreen);
        },
      ),
    ]);
  }
}
