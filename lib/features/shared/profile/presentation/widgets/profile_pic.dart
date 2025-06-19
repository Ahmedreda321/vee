import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_size.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.imageUrl,
    this.isEditing = false,
    this.onEditPressed,
  });

  final String imageUrl;

  final bool isEditing;

  final VoidCallback? onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: AppSize.profileImageRadius,
          backgroundColor: AppColor.extraGray,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: AppSize.profileImageRadius * 2,
              height: AppSize.profileImageRadius * 2,
              fit: BoxFit.cover,
              placeholder: (ctx, url) => SizedBox(
                width: AppSize.profileImageRadius,
                height: AppSize.profileImageRadius,
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (ctx, url, error) => Icon(
                Icons.account_circle,
                size: AppSize.profileImageRadius * 2,
                color: AppColor.grayColor,
              ),
            ),
          ),
        ),

        // طبقة شفافة وأيقونة الكاميرا عند التحرير
        if (isEditing) ...[
          Container(
            width: AppSize.profileImageRadius * 2,
            height: AppSize.profileImageRadius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.opacityBlue,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: IconButton(
                onPressed: onEditPressed,
                icon: Icon(
                  Icons.camera_alt,
                  size: AppSize.extraExtraLarge,
                  color: AppColor.white,
                ),
                tooltip: 'Edit Profile Picture',
              ),
            ),
          ),
        ],
      ],
    );
  }
}
