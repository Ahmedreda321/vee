import 'package:json_annotation/json_annotation.dart';

part 'reports_respons_models.g.dart';

@JsonSerializable()
class DriverReportsBaseRespons {
  final String? id;
  final String? reportType;
  final ReportsDriverResponse? driver;
  final ReportsVehicleResponse? vehicle;
  final String? reportedAt;
  final String? status;
  final String? destination;
  final int? fuelCost;
  final bool? seen;

  DriverReportsBaseRespons({
    required this.id,
    required this.reportType,
    required this.driver,
    required this.vehicle,
    required this.reportedAt,
    required this.status,
    required this.destination,
    required this.fuelCost,
    required this.seen,
  });

  factory DriverReportsBaseRespons.fromJson(Map<String, dynamic> json) =>
      _$DriverReportsBaseResponsFromJson(json);

  Map<String, dynamic> toJson() => _$DriverReportsBaseResponsToJson(this);
}

@JsonSerializable()
class ReportsDriverResponse {
  String? id;
  String? displayName;

  ReportsDriverResponse({
    required this.id,
    required this.displayName,
  });
  factory ReportsDriverResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportsDriverResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReportsDriverResponseToJson(this);
}

@JsonSerializable()
class ReportsVehicleResponse {
  String? id;
  String? palletNumber;
  ReportsVehicleModelDtoResponse vehicleModelDto;

  ReportsVehicleResponse({
    required this.id,
    required this.palletNumber,
    required this.vehicleModelDto,
  });
  factory ReportsVehicleResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportsVehicleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsVehicleResponseToJson(this);
}

@JsonSerializable()
class ReportsVehicleModelDtoResponse {
  String id;
  String name;
  String fuelEfficiency;
  ReportsBrandResponse brand;
  ReportsCategoryResponse category;

  ReportsVehicleModelDtoResponse({
    required this.id,
    required this.name,
    required this.fuelEfficiency,
    required this.brand,
    required this.category,
  });
  factory ReportsVehicleModelDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportsVehicleModelDtoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReportsVehicleModelDtoResponseToJson(this);
}

@JsonSerializable()
class ReportsBrandResponse {
  String id;
  String name;
  String country;

  ReportsBrandResponse({
    required this.id,
    required this.name,
    required this.country,
  });
  factory ReportsBrandResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportsBrandResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsBrandResponseToJson(this);
}

@JsonSerializable()
class ReportsCategoryResponse {
  String id;
  String name;
  String description;

  ReportsCategoryResponse({
    required this.id,
    required this.name,
    required this.description,
  });
  factory ReportsCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportsCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsCategoryResponseToJson(this);
}
