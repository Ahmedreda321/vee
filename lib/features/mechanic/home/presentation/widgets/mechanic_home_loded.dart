import 'package:flutter/material.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';
import 'package:vee/core/routing/routes.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../driver/home/presentation/widgets/custom_app_bar.dart';
import '../../domain/entities/maintenance_entitied.dart';
import 'mechanic_home_listview.dart';

class MechanicHomeLoaded extends StatelessWidget {
  final MechanicHomeEntities data;
  const MechanicHomeLoaded({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          imageUrl: "https://cdn-icons-png.flaticon.com/512/149/149071.png",
          title: "${data.maintenanceEntities.length} ${AppStrings.problem}",
          subtitle: AppStrings.upcomingMaintenances,
          onNotificationTap:(){} ,
          onProfileButtonTap: () => context.pushNamed(Routes.profileScreen)),
      body: MechanicHomeListView(
        maintenances: data.maintenanceEntities,
      ),
    );
  }
}