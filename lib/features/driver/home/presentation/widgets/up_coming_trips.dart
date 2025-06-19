import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';

class UpComingTrips extends StatelessWidget {
  const UpComingTrips({
    super.key,
    required this.subtitle,
    required this.title,
  });

  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(subtitle, style: AppTextStyles.appBarSubtitle),
        Text(title, style: AppTextStyles.appBarTitle),
      ],
    );
  }
}
