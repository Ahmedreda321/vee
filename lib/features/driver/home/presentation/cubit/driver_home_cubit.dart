import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../domain/entities/driver_home_entities.dart';
import '../../domain/usecases/get_trips_ues_case.dart';
import '../../domain/usecases/start_trip_use_case.dart';
import 'driver_home_state.dart';

class DriverHomeCubit extends Cubit<DriverHomeState> {
  final GetTripsUseCase _getTripsUseCase;
  final StartTripUseCase _startTripUseCase;

  DriverHomeCubit(this._getTripsUseCase, this._startTripUseCase) : super(const DriverHomeState.initial());

  void getDriverHomeData() {
    emit(const DriverHomeState.loading());
    _getTripsUseCase(NoParams()).then((result) {
      result.fold(
        (failure) => emit(DriverHomeState.error(failure.message)),
        (data) => emit(DriverHomeState.loaded(data)),
      );
    });
    
  }
   void startTrip(TripEntity trip) async {
    emit(const DriverHomeState.tripLoding());
    
    final result = await _startTripUseCase(trip.id); // Use the use case
    
    result.fold(
      (failure) => emit(DriverHomeState.tripError(failure.message)),
      (_) => emit(DriverHomeState.tripLoaded(trip)),
    );
  }

}
