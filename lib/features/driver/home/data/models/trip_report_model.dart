import 'package:json_annotation/json_annotation.dart';

part 'trip_report_model.g.dart';

@JsonSerializable()
class TripReportModel {
  final String details;
  final int fuelRefile;
  final double cost;

  TripReportModel({
    required this.details,
    required this.fuelRefile,
    required this.cost,
  });

  factory TripReportModel.fromJson(Map<String, dynamic> json) =>
      _$TripReportModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripReportModelToJson(this);
}
