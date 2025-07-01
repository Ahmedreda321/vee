import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';
import 'package:vee/core/extensions/sizedbox_extensions.dart';
import 'package:vee/core/services/logger_service.dart';
import 'package:vee/core/utils/app_size.dart';
import 'package:vee/features/driver/home/domain/entities/driver_home_entities.dart';

import '../../../../../core/constants/strings_constants.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/services/map_services/map_screen.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_circular_indicator.dart';
import '../../data/models/fault_report_model.dart';
import '../../data/models/trip_report_model.dart';
import '../cubits/cubit/map_screen_cubit.dart';
import '../cubits/cubit/map_screen_state.dart';
import '../widgets/app_error_dialog.dart';

class MapView extends StatelessWidget {
  final TripEntity trip;
  const MapView({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<MapScreenCubit, MapScreenState>(
      listenWhen: (previous, current) =>
          current is Loaded ||
          current is Error ||
          current is Loading ||
          current is FaultLoading ||
          current is FaultLoaded ||
          current is FaultError,
      listener: (context, state) {
        state.whenOrNull(
          reportError: (message) {
            Navigator.of(context).pop();
            showErrorDialog(context, message);
          },
          reportLoading: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: AppCircularIndicator()));
          },
          reportLoaded: () {
            context.back();
            context.pushReplacementNamed(Routes.driverHomeScreen);
          },
          faultError: (message) {
            Navigator.of(context).pop();
            showErrorDialog(context, message);
          },
          faultLoading: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: AppCircularIndicator()));
          },
          faultLoaded: () {
            context.back();
            context.pushReplacementNamed(Routes.driverHomeScreen);
          },
        );
      },
      child: Stack(children: [
        MapScreen(
          tripId: trip.id,
          destinationLocationNominatimLink:
              trip.destinationLocationNominatimLink,
          pickupLocationNominatimLink: trip.pickupLocationNominatimLink,
        ),
        FinshTripBottm(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: const Text(AppStrings.finishTrip),
                    content: const Text(AppStrings.doYouHave),
                    actions: [
                      TextButton(
                        onPressed: () {
                          dialogContext.back();
                          _showFaultReportBottomSheet(context);
                        },
                        child: const Text(
                          AppStrings.yes,
                          style: TextStyle(color: AppColor.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          dialogContext.back();
                          _showReportBottomSheet(context);
                        },
                        child: const Text(
                          AppStrings.no,
                          style: TextStyle(color: AppColor.red),
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      ]),
    ));
  }

  void _showFaultReportBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (bottomSheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
            left: AppSize.large.w,
            right: AppSize.large.w,
            top: AppSize.large.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: AppSize.large.h ,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  AppStrings.faultReport,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: AppStrings.details,
                  ),
                  controller:
                      context.read<MapScreenCubit>().faultDetailsController,
                  maxLines: 3,
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: AppStrings.cost,
                    prefixText: '\$ ',
                  ),
                  controller:
                      context.read<MapScreenCubit>().faultCostController,
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: AppStrings.faultFuelRefill,
                    prefixText: '\$ ',
                  ),
                  controller:
                      context.read<MapScreenCubit>().faultFuelRefillController,
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: AppStrings.faultType,
                  ),
                  keyboardType: TextInputType.number,
                  controller:
                      context.read<MapScreenCubit>().faultTypeController,
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: AppStrings.address,
                  ),
                  controller: context.read<MapScreenCubit>().addressController,
                ),
                Row(
                  spacing: AppSize.large.w ,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          bottomSheetContext.back();
                        },
                        child: const Text(AppStrings.cancel),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _submitFaultReport(context, bottomSheetContext);
                        },
                        child: const Text(AppStrings.submit),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FinshTripBottm extends StatelessWidget {
  final VoidCallback onTap;
  const FinshTripBottm({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppSize.average.h,
      right: AppSize.average.w,
      left: AppSize.average.w,
      child: ElevatedButton(
        onPressed: onTap,
        child: const Text(AppStrings.finishTrip),
      ),
    );
  }
}

void _showReportBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (bottomSheetContext) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
          left: AppSize.large.w,
          right: AppSize.large.w,
          top: AppSize.large.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppSize.large.h,
          children: [
            const Text(
              AppStrings.tripReport,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: AppStrings.details,
              ),
              controller: context.read<MapScreenCubit>().detailsController,
              maxLines: 3,
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: AppStrings.cost,
                prefixText: '\$ ',
              ),
              controller: context.read<MapScreenCubit>().costController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: context.read<MapScreenCubit>().fuelRefileController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: AppStrings.fuelRefile ,
              ),
            ),
           verticalSpace(5),
            Row(
              spacing: AppSize.large.w,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      bottomSheetContext.back();
                    },
                    child: const Text(AppStrings.cancel,style: TextStyle(color: AppColor.red),),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _submitReport(context, bottomSheetContext);
                    },
                    child: const Text(AppStrings.submit),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

void _submitReport(BuildContext context, BuildContext bottomSheetContext) {
  final cubit = context.read<MapScreenCubit>();

  final costText = cubit.costController.text.trim();
  final fuelText = cubit.fuelRefileController.text.trim();
  final detailsText = cubit.detailsController.text.trim();

  if (costText.isEmpty || fuelText.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppStrings.tripReportDesc),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  double? cost;
  int? fuelRefile;

  try {
    cost = double.parse(costText);
    if (cost < 0) {
      throw const FormatException('Cost cannot be negative');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a valid cost amount'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  try {
    fuelRefile = int.parse(fuelText);
    if (fuelRefile < 0) {
      throw const FormatException('Fuel amount cannot be negative');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a valid fuel amount'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  final tripReport = TripReportModel(
    details: detailsText.isEmpty ? 'No additional comments' : detailsText,
    cost: cost,
    fuelRefile: fuelRefile,
  );

  bottomSheetContext.back();
  cubit.reportTrip(tripReport);
}

void _submitFaultReport(BuildContext context, BuildContext bottomSheetContext) {
  final cubit = context.read<MapScreenCubit>();

  final costText = cubit.faultCostController.text.trim();
  final fuelText = cubit.faultFuelRefillController.text.trim();
  final detailsText = cubit.faultDetailsController.text.trim();
  final faultTypeText = cubit.faultTypeController.text.trim();
  final addressText = cubit.addressController.text.trim();

  // Validate required fields
  if (costText.isEmpty ||
      fuelText.isEmpty ||
      faultTypeText.isEmpty ||
      addressText.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppStrings.tripReportDesc),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  int? cost;
  int? fuelRefile;
  int? faultType;

  // Validate cost (as int according to model)
  try {
    cost = int.parse(costText);
    if (cost < 0) {
      throw const FormatException('Cost cannot be negative');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a valid cost amount'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  // Validate fuel refill (as int according to model)
  try {
    fuelRefile = int.parse(fuelText);
    if (fuelRefile < 0) {
      throw const FormatException('Fuel amount cannot be negative');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a valid fuel amount'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  // Validate fault type
  try {
    faultType = int.parse(faultTypeText);
    if (faultType < 0) {
      throw const FormatException('Fault type cannot be negative');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a valid fault type number'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  // Create fault report model
  final faultReport = FaultReportModel(
    details: detailsText.isEmpty ? 'No additional details' : detailsText,
    cost: cost,
    fuelRefile: fuelRefile,
    faultType: faultType,
    address: addressText,
  );
  AppLogger.i(faultReport);
  bottomSheetContext.back();
  cubit.faultReport(faultReport);
}


////  TODO: Refactor 