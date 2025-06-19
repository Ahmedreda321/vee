import 'package:flutter/material.dart';
import 'package:vee/core/theme/app_text_styles.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../widgets/back_button.dart';
import '../widgets/profile_form.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text(AppStrings.profile, style: AppTextStyles.screenTitle),
        leading: BackArrowButton(),
      ),
      body: const SafeArea(
        child: ProfileForm(),
      ),
    );
  }
}
