import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_circular_indicator.dart';
import '../cubit/mechanic_home_cubit.dart';
import '../cubit/mechanic_home_state.dart';
import '../widgets/mechanic_home_loded.dart';

class MechanicHomeScreen extends StatelessWidget {
  const MechanicHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MechanicHomeCubit, MechanicHomeState>(
      buildWhen: (previous, current) =>
          current is Loaded || current is Error || current is Loading,
      builder: (context, state) {
        return state.maybeWhen(
          // Handle the case when the state is not recognized
          orElse: () => const SizedBox.shrink(),
          // Show loading indicator while fetching data
          loading: () => const Scaffold(body: Center(child: AppCircularIndicator())),
          // Show error message if there's an error
          error: (message) => Scaffold(body: Center(child: Text(message))),
          // Show the data if it's loaded
          loaded: (data) => MechanicHomeLoaded(data: data),
        );
      },
    );
  }
}
