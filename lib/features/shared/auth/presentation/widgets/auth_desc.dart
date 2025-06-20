import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';

class AuthDesc extends StatelessWidget {
  const AuthDesc({
    super.key,
    required this.desc,
  });
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      textAlign: TextAlign.center,
      maxLines: 3,
      style: AppTextStyles.authDesc,
    );
  }
}
