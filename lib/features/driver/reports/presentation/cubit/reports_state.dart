import 'package:freezed_annotation/freezed_annotation.dart';

part 'reports_state.freezed.dart';

@freezed
class DriverReportsState<T> with _$DriverReportsState<T> {
  const factory DriverReportsState.initial() = _Initial<T>;
  const factory DriverReportsState.loading() = Loading<T>;
  const factory DriverReportsState.loaded({required T data}) = Loaded<T>;
  const factory DriverReportsState.error({required String message}) = Error<T>;
}
