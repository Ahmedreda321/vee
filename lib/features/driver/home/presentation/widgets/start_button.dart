import 'package:flutter/material.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_size.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: AppSize.homeCardButtonSize),
      onPressed: () {
        context.pushNamed("skd");
      },
      child: Text(AppStrings.start, style: AppTextStyles.tripCardButton),
    );
  }
}
