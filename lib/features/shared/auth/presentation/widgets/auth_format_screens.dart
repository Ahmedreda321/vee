import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import 'auth_app_bar.dart';
import 'auth_container.dart';

class AuthFormatScreens extends StatelessWidget {
  const AuthFormatScreens({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                  minHeight: 140.h, maxHeight: 180.h, title: "LOGO"),
            )
          ];
        },
        body: AuthContainer(children: children),
      ),
    );
  }
}
