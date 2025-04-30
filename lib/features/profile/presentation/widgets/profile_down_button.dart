import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/extensions/sizedbox_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../cubit/profile_cubit.dart';

class ProfileDownButton extends StatelessWidget {
  const ProfileDownButton({
    super.key,
    required this.isEditing,
  });
  final bool isEditing;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!isEditing)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.blue,
                minimumSize: AppSize.editProfileSize),
            onPressed: () => context.read<ProfileCubit>().enableEdit(),
            child: Text(
              AppStrings.edit,
            ),
          ),
        if (isEditing) ...[
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.red),
              onPressed: () => context.read<ProfileCubit>().cancelEdit(),
              child: const Text(AppStrings.cancel),
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.green),
              onPressed: () {
                // Save logic here
                context.read<ProfileCubit>().cancelEdit();
              },
              child: const Text(AppStrings.save),
            ),
          ),
        ],
      ],
    );
  }
}
