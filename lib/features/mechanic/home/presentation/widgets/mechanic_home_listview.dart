import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vee/features/mechanic/home/presentation/widgets/mechanic_home_card.dart';

import '../../../../../../core/constants/strings_constants.dart';
import '../../../../../../core/extensions/sizedbox_extensions.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/utils/app_padding.dart';
import '../../../../../../core/widgets/trip_card_info.dart';
import '../../domain/entities/maintenance_entitied.dart';

class MechanicHomeListView extends StatelessWidget {
  final List<MaintenanceEntity> maintenances;
  const MechanicHomeListView({
    super.key,
    required this.maintenances,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.small,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              AppStrings.mechanicTasks,
              style: AppTextStyles.homeScreenListTile,
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(10)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final maintenance = maintenances[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: MechanicHomeCard(
                    category: maintenance.category,
                    status: maintenance.status,
                    onPressed: () {},
                    
                    vehicleInfo: TripCardInfo(
                      title: AppStrings.vehicle,
                      value:
                          "${maintenance.vehicle.name} - (${maintenance.vehicle.palletNumber})",
                    ), decriptionInfo: TripCardInfo(
                      title: AppStrings.description,
                      value: maintenance.description,
                    ),
                  ),
                );
              },
              childCount: maintenances.length,
            ),
          ),
        ],
      ),
    );
  }
}
