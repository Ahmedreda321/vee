import 'package:flutter/material.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';

import '../../../../../core/extensions/sizedbox_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/app_size.dart';
import '../widgets/get_started.dart';
import '../widgets/on_boarding_desc.dart';
import '../widgets/on_boarding_icon.dart';
import '../widgets/on_boarding_welcome.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.large,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(80),
              OnBoardingIcon(),
              verticalSpace(AppSize.medium),
              OnBoardingWelcome(),
              verticalSpace(AppSize.medium),
              OnBoardingDesc(),
              Spacer(),
              GetStarted(
                onPressed: () {
                  context.pushNamedAndRemoveUntil(Routes.loginScreen);
                },
              ),
              //  verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
