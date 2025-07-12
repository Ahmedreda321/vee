// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_respons_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverReportsBaseRespons _$DriverReportsBaseResponsFromJson(
        Map<String, dynamic> json) =>
    DriverReportsBaseRespons(
      id: json['id'] as String?,
      reportType: json['reportType'] as String?,
      driver: json['driver'] == null
          ? null
          : ReportsDriverResponse.fromJson(
              json['driver'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : ReportsVehicleResponse.fromJson(
              json['vehicle'] as Map<String, dynamic>),
      reportedAt: json['reportedAt'] as String?,
      status: json['status'] as String?,
      destination: json['destination'] as String?,
      fuelCost: (json['fuelCost'] as num?)?.toInt(),
      seen: json['seen'] as bool?,
    );

Map<String, dynamic> _$DriverReportsBaseResponsToJson(
        DriverReportsBaseRespons instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reportType': instance.reportType,
      'driver': instance.driver,
      'vehicle': instance.vehicle,
      'reportedAt': instance.reportedAt,
      'status': instance.status,
      'destination': instance.destination,
      'fuelCost': instance.fuelCost,
      'seen': instance.seen,
    };

ReportsDriverResponse _$ReportsDriverResponseFromJson(
        Map<String, dynamic> json) =>
    ReportsDriverResponse(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$ReportsDriverResponseToJson(
        ReportsDriverResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
    };

ReportsVehicleResponse _$ReportsVehicleResponseFromJson(
        Map<String, dynamic> json) =>
    ReportsVehicleResponse(
      id: json['id'] as String?,
      palletNumber: json['palletNumber'] as String?,
      vehicleModelDto: ReportsVehicleModelDtoResponse.fromJson(
          json['vehicleModelDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportsVehicleResponseToJson(
        ReportsVehicleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'palletNumber': instance.palletNumber,
      'vehicleModelDto': instance.vehicleModelDto,
    };

ReportsVehicleModelDtoResponse _$ReportsVehicleModelDtoResponseFromJson(
        Map<String, dynamic> json) =>
    ReportsVehicleModelDtoResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      fuelEfficiency: json['fuelEfficiency'] as String?,
      brand: json['brand'] as String,
      category: ReportsCategoryResponse.fromJson(
          json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportsVehicleModelDtoResponseToJson(
        ReportsVehicleModelDtoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fuelEfficiency': instance.fuelEfficiency,
      'brand': instance.brand,
      'category': instance.category,
    };

ReportsCategoryResponse _$ReportsCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    ReportsCategoryResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ReportsCategoryResponseToJson(
        ReportsCategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
