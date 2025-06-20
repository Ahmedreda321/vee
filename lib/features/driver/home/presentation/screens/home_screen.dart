import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vee/core/constants/strings_constants.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';
import 'package:vee/core/extensions/sizedbox_extensions.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/widgets/trip_card_info.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/home_trip_card.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          imageUrl: "https://cdn-icons-png.flaticon.com/512/149/149071.png",
          onProfileButtonTap: () => context.pushNamed(Routes.profileScreen),
          title: "20 Trips",
          subtitle: "Upcoming Trips",
          onNotificationTap: () => context.pushNamed(Routes.notificationScreen),
        ),
        body: Padding(
          padding: AppPadding.small,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.trips,
                  style: AppTextStyles.homeScreenListTile,
                ),
              ),
              SliverToBoxAdapter(child: verticalSpace(10)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: const HomeTripCard(
                      tripInfo: TripCardInfo(
                        title: AppStrings.trip,
                        value: "From Alex → Cairo",
                      ),
                      vehicleInfo: TripCardInfo(
                        title: AppStrings.vehicle,
                        value: "Toyota Corolla - White (ABC-1234)",
                      ),
                    ),
                  ),
                  childCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//? this? or this!!!

// import 'package:flutter/material.dart';
// import 'package:vee/core/extensions/navigation_extensions.dart';

// import '../../../../../core/constants/strings_constants.dart';
// import '../../../../../core/routing/routes.dart';
// import '../../../../../core/theme/app_colors.dart';
// import '../../../../../core/theme/app_text_styles.dart';
// import '../../../../../core/utils/app_padding.dart';
// import '../../../../../core/utils/app_size.dart';
// import '../widgets/custom_app_bar.dart';
// import '../widgets/home_trip_card.dart';
// import '../../../../../core/widgets/trip_card_info.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColor.white,
//         body: NestedScrollView(
//           headerSliverBuilder: (context, innerBoxIsScrolled) => [
//             SliverAppBar(
//               leading: const SizedBox(),
//               pinned: true,
//               floating: true,
//               expandedHeight: AppSize.homeAppBarHeight,
//               flexibleSpace: FlexibleSpaceBar(
//                 background: CustomAppBar(
//                   imageUrl:
//                       "https://cdn-icons-png.flaticon.com/512/149/149071.png",
//                   onProfileButtonTap: () =>
//                       context.pushNamed(Routes.profileScreen),
//                   title: "20 Trips",
//                   subtitle: AppStrings.upcomingTrips,
//                   onNotificationTap: () =>
//                       context.pushNamed(Routes.notificationScreen),
//                 ),
//               ),
//             ),
//           ],
//           body: Padding(
//             padding: AppPadding.small,
//             child: CustomScrollView(
//               slivers: [
//                 SliverToBoxAdapter(
//                   child: Text(
//                     AppStrings.trips,
//                     style: AppTextStyles.homeScreenListTile,
//                   ),
//                 ),
//                 SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                     (context, index) => HomeTripCard(
//                       tripInfo: TripCardInfo(
//                         title: AppStrings.trip,
//                         value: "From Alex → Cairo",
//                       ),
//                       vehicleInfo: TripCardInfo(
//                         title: AppStrings.vehicle,
//                         value: "Toyota Corolla - White (ABC-1234515164611651)",
//                       ),
//                     ),
//                     childCount: 20,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
