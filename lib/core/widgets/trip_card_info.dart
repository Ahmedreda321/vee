import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class TripCardInfo extends StatelessWidget {
  const TripCardInfo({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.tripCardInfoTitle,
          maxLines: 1,
        ),
        Text(
          value,
          style: AppTextStyles.tripCardInfoValue,
          maxLines: 1,
        ),
      ],
    );
  }
}
