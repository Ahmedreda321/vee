
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/core/constants/strings_constants.dart';

import '../../../../shared/profile/presentation/widgets/back_button.dart';
import '../cubit/reports_cubit.dart';

class OnGetReportsError extends StatelessWidget {
  final String message;
  const OnGetReportsError({
    super.key, required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowButton(),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const SizedBox(height: 16),
            ElevatedButton(
             style: ButtonStyle(
              minimumSize:  WidgetStateProperty.all<Size>(
                const Size(100, 50)
              )
             ),
    
              onPressed: () {
                context.read<DriverReportsCubit>().getDriverReports();
              },
              child: const Text(AppStrings.tryAgain),
            ),
          ],
        ),
      ),
    );
  }
}
