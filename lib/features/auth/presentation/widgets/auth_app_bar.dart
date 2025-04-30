import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/svg_bottom_clipper.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final String title;

  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.title,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final height = (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);
    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipPath(
            clipper: SvgBottomClipper(),
            child: SvgPicture.asset(
              Assets.assetsSvgsAuthAppBarSvg,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: Text(title,
                style: AppTextStyles.logo), //! should Have Some Bottom Padding
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
//TODO refactor
