import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_screen_state.freezed.dart';

@freezed
class MapScreenState<T> with _$MapScreenState<T> {
  const factory MapScreenState.initial() = _Initial;
  const factory MapScreenState.reportLoading() = Loading;
  const factory MapScreenState.reportLoaded() = Loaded;
  const factory MapScreenState.reportError(String message) = Error;
  const factory MapScreenState.faultLoading() = FaultLoading;
  const factory MapScreenState.faultLoaded() = FaultLoaded;
  const factory MapScreenState.faultError(String message) = FaultError;
}
