// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vee/core/utils/app_size.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/widgets/app_container.dart';
import '../../../../../core/widgets/trip_card_info.dart';
import 'mechanic_start_button.dart';

class MechanicHomeCard extends StatelessWidget {
  const MechanicHomeCard({
    super.key,
    required this.status,
    required this.decriptionInfo,
    required this.onPressed,
    required this.category,
    required this.vehicleInfo,
  });
  final String status, category;
  final TripCardInfo vehicleInfo, decriptionInfo;
  final VoidCallback? onPressed;
  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'in progress':
      case 'inprogress':
        return Colors.blue;
      case 'completed':
      case 'finished':
        return Colors.green;
      case 'accepted':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: AppPadding.small,
      child: Column(
        spacing: AppSize.small,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          vehicleInfo,
          decriptionInfo,
          Align(
              alignment: Alignment.centerLeft,
            child: Container(
              padding: AppPadding.small,
            
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _getStatusColor(),
              ),
              child: Text(
                status,
                style: AppTextStyles.tripCardButton,
              ),
            ),
          ),
          StartRepairButton(onPressed: onPressed, status: status),
        ],
      ),
    );
  }
}
