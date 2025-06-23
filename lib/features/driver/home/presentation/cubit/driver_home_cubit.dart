import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../domain/usecases/get_trips_ues_case.dart';
import 'driver_home_state.dart';

class DriverHomeCubit extends Cubit<DriverHomeState> {
  final GetTripsUseCase _getTripsUseCase;

  DriverHomeCubit(this._getTripsUseCase) : super(const DriverHomeState.initial());

  void getDriverHomeData() {
    emit(const DriverHomeState.loading());
    _getTripsUseCase(NoParams()).then((result) {
      result.fold(
        (failure) => emit(DriverHomeState.error(failure.message)),
        (data) => emit(DriverHomeState.loaded(data)),
      );
    });
    
  }
}
