import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_circular_indicator.dart';
import '../../../../shared/profile/presentation/widgets/back_button.dart';
import '../cubit/reports_cubit.dart';
import '../cubit/reports_state.dart';
import '../widgets/driver_reports_loaded_screen.dart';
import '../widgets/on_get_reports_error.dart';

class DriverReportsScreen extends StatelessWidget {
  const DriverReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<DriverReportsCubit, DriverReportsState>(
      buildWhen: (previous, current) {
        return  current is Loaded || current is Error || current is Loading;
      },
      builder: (context, state) {
        return state.maybeWhen(
          // Handle the case when the state is not recognized
          orElse: () => const SizedBox.shrink(),
          // Show loading indicator while fetching data
          loading: () =>
              const Scaffold(body: Center(child: AppCircularIndicator())),
          // Show error message if there's an error
          error: (message) =>  OnGetReportsError(message: message,),
          // Show the data if it's loaded
          loaded: (data) => DriverReportsLoadedScreen(data: data),
        );
      },
    ));
  }
}
