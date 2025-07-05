import 'package:json_annotation/json_annotation.dart';

part 'lcation_update_model.g.dart';

@JsonSerializable()
class LcationUpdateModel {
  final int statusCode;
  final String tripId;
  final double startLat;
  final double startLng;
  final double destinationLat;
  final double destinationLng;
  final double lat;
  final double lng;
  final String timestamp;
  final double distance;

  LcationUpdateModel({
    required this.statusCode,
    required this.tripId,
    required this.startLat,
    required this.startLng,
    required this.destinationLat,
    required this.destinationLng,
    required this.lat,
    required this.lng,
    required this.timestamp,
    required this.distance,
  });

  factory LcationUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$LcationUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$LcationUpdateModelToJson(this);
}
