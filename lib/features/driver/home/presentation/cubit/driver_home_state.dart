import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vee/features/driver/home/domain/entities/driver_home_entities.dart';

part 'driver_home_state.freezed.dart';

@freezed
class DriverHomeState<T> with _$DriverHomeState<T> {
  const factory DriverHomeState.initial() = _Initial;
  const factory DriverHomeState.loading() = Loading;
  const factory DriverHomeState.loaded(DriverHomeEntities data) = Loaded;
  const factory DriverHomeState.error(String message) = Error;
  const factory DriverHomeState.tripLoding() = TripLoading;
  const factory DriverHomeState.tripLoaded(TripEntity trip) = TripLoaded;
  const factory DriverHomeState.tripError(String message) = TripError;
  const factory DriverHomeState.unauthorized() = Unauthorized;
}
