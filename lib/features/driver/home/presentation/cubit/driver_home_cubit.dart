// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../core/usecases/base_use_case.dart';
// import '../../domain/entities/driver_home_entities.dart';
// import '../../domain/usecases/get_trips_ues_case.dart';
// import '../../domain/usecases/start_trip_use_case.dart';
// import 'driver_home_state.dart';

// class DriverHomeCubit extends Cubit<DriverHomeState> {
//   final GetTripsUseCase _getTripsUseCase;
//   final StartTripUseCase _startTripUseCase;

//   DriverHomeCubit(this._getTripsUseCase, this._startTripUseCase) : super(const DriverHomeState.initial());

//   void getDriverHomeData() {
//     emit(const DriverHomeState.loading());
//     _getTripsUseCase(NoParams()).then((result) {
//       result.fold(
//         (failure) => emit(DriverHomeState.error(failure.message)),
//         (data) => emit(DriverHomeState.loaded(data)),
//       );
//     });

//   }
//    void startTrip(TripEntity trip) async {
//     emit(const DriverHomeState.tripLoding());

//     final result = await _startTripUseCase(trip.id);

//     result.fold(
//       (failure) => emit(DriverHomeState.tripError(failure.message)),
//       (_) => emit(DriverHomeState.tripLoaded(trip)),
//     );
//   }

// }

//************************************************************ */

import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../../../../core/utils/app_shared_pref_consts.dart';
import '../../../../../core/utils/app_shared_preferences.dart';
import '../../domain/entities/driver_home_entities.dart';
import '../../domain/usecases/get_trips_ues_case.dart';
import '../../domain/usecases/start_trip_use_case.dart';
import 'driver_home_state.dart';

class DriverHomeCubit extends Cubit<DriverHomeState> {
  final GetTripsUseCase _getTripsUseCase;
  final StartTripUseCase _startTripUseCase;

  // Keep track of the loaded data for overlay loading
  DriverHomeEntities? _lastLoadedData;

  DriverHomeCubit(this._getTripsUseCase, this._startTripUseCase)
      : super(const DriverHomeState.initial());

  void getDriverHomeData() {
    emit(const DriverHomeState.loading());
    _getTripsUseCase(NoParams()).then((result) {
      result.fold(
        (failure) {
          if (_isUnauthorizedError(failure.message)) {
            _handleUnauthorizedAccess();
          }else {
            emit(DriverHomeState.error(failure.message));
          }
        },
        (data) {
          _lastLoadedData = data;
          emit(DriverHomeState.loaded(data));
        },
      );
    });
  }

  void startTrip(TripEntity trip) async {
    // Show loading overlay while keeping the list in background
    emit(const DriverHomeState.tripLoding());

    final result = await _startTripUseCase(trip.id);

    result.fold(
      (failure) {
          // Check if it's unauthorized error
        if (_isUnauthorizedError(failure.message)) {
          _handleUnauthorizedAccess();
          return;
        }
        // Go back to loaded state and show error dialog
        if (_lastLoadedData != null) {
          emit(DriverHomeState.loaded(_lastLoadedData!));
        }
        // Emit error state that will trigger the dialog
        emit(DriverHomeState.tripError(failure.message));
      },
      (_) {
        // Trip started successfully, emit trip loaded
        emit(DriverHomeState.tripLoaded(trip));
      },
    );
  }

  // Method to reset to loaded state (useful when coming back from map)
  void resetToLoadedState() {
    if (_lastLoadedData != null) {
      emit(DriverHomeState.loaded(_lastLoadedData!));
    } else {
      getDriverHomeData();
    }
  }

  // Check if the error is unauthorized (401)
  bool _isUnauthorizedError(String errorMessage) {
    return errorMessage.toLowerCase().contains('unauthorized') ||
        errorMessage.contains('401') ||
        errorMessage.toLowerCase().contains('email or password is incorrect');
  }

  // Handle unauthorized access by clearing user data and emitting logout state
  Future<void> _handleUnauthorizedAccess() async {
    // Clear stored user data
    await AppPreferences.removeSecureData(AppSharedPrefConsts.userToken);
    await AppPreferences().removeData(AppSharedPrefConsts.userRole);

    // Reset last loaded data
    _lastLoadedData = null;

    // Emit unauthorized state that will trigger navigation to login
    emit(const DriverHomeState.unauthorized());
  }
}
