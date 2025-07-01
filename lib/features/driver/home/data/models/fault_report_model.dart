import 'package:json_annotation/json_annotation.dart';

part 'fault_report_model.g.dart';

@JsonSerializable()
class FaultReportModel {
  final int faultType;
  final String address;
  final String details;
  final int cost;
  final int fuelRefile;

  FaultReportModel({
    required this.faultType,
    required this.address,
    required this.details,
    required this.cost,
    required this.fuelRefile,
  });

  factory FaultReportModel.fromJson(Map<String, dynamic> json) =>
      _$FaultReportModelFromJson(json);
  Map<String, dynamic> toJson() => _$FaultReportModelToJson(this);
}
