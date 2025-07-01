import 'package:json_annotation/json_annotation.dart';

import 'trip_model.dart';
part 'driver_home_response.g.dart';

@JsonSerializable()
class DriverHomeResponse {
  final int? statusCode;
  final String? message;
  @JsonKey(name: 'tripRequests')
  final List<TripResponse>? trips;

  const DriverHomeResponse(this.message, {this.statusCode, this.trips});

  factory DriverHomeResponse.fromJson(Map<String, dynamic> json) =>
      _$DriverHomeResponseFromJson(json);
  @override
  String toString() =>
      'DriverHomeResponse{statusCode: $statusCode, message: $message, trips: $trips}';
}
