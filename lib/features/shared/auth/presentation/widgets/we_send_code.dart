import 'package:flutter/material.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/theme/app_text_styles.dart';

class WeSendCode extends StatelessWidget {
  const WeSendCode({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: AppStrings.weSentACode,
        style: AppTextStyles.forgotPassword,
        children: [
          TextSpan(
            text: email,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
