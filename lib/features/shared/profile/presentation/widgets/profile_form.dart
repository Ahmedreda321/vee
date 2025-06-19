import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/extensions/sizedbox_extensions.dart';
import '../../../../../core/utils/app_padding.dart';
import '../cubit/profile_cubit.dart';
import 'label.dart';
import 'profile_down_button.dart';
import 'profile_field.dart';
import 'profile_pic.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController mobileController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: 'Blake Gordon');
    emailController = TextEditingController(text: 'blake@email.com');
    usernameController = TextEditingController(text: 'ahmed@example');
    mobileController = TextEditingController(text: '+20 1278921767');
    addressController =
        TextEditingController(text: 'Egypt , 10th of ramdan , .....');
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    mobileController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.small,
      child: BlocBuilder<ProfileCubit, bool>(
        builder: (context, isEditing) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      verticalSpace(20),
                      ProfilePic(
                          isEditing: isEditing,
                          imageUrl:
                              'https://as2.ftcdn.net/v2/jpg/03/26/98/51/1000_F_326985142_1aaKcEjMQW6ULp6oI9MYuv8lN9f8sFmj.jpg'),
                      verticalSpace(30),
                      Label(label: AppStrings.yourName),
                      ProfileField(
                          controller: nameController, isEditing: isEditing),
                      Label(label: AppStrings.yourEmail),
                      ProfileField(
                          controller: emailController, isEditing: isEditing),
                      Label(label: AppStrings.userName),
                      ProfileField(
                          controller: usernameController, isEditing: isEditing),
                      Label(label: AppStrings.mobile),
                      ProfileField(
                        controller: mobileController,
                        type: TextInputType.phone,
                        isEditing: isEditing,
                      ),
                      Label(label: AppStrings.address),
                      ProfileField(
                          controller: addressController, isEditing: isEditing),
                      verticalSpace(30),
                    ],
                  ),
                ),
              ),
              ProfileDownButton(isEditing: isEditing),
            ],
          );
        },
      ),
    );
  }
}
