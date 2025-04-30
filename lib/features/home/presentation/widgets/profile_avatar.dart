import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/utils/app_border_radius.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppBorderRadius.homeProfileIconRadius * 2,
        height: AppBorderRadius.homeProfileIconRadius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.grayColor,
          boxShadow: AppShadows.secondaryShadow,
        ),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: AppBorderRadius.homeProfileIconRadius * 2,
            height: AppBorderRadius.homeProfileIconRadius * 2,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: AppColor.extraGray,
              child: Center(
                child: Icon(Icons.person,
                    size: AppBorderRadius.homeProfileIconRadius,
                    color: AppColor.white),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: AppColor.extraGray,
              child: Center(
                child: Icon(Icons.error_outline_sharp,
                    size: AppBorderRadius.homeProfileIconRadius,
                    color: AppColor.errorColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
