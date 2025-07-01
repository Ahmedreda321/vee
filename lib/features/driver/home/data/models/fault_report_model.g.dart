// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fault_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaultReportModel _$FaultReportModelFromJson(Map<String, dynamic> json) =>
    FaultReportModel(
      faultType: (json['faultType'] as num).toInt(),
      address: json['address'] as String,
      details: json['details'] as String,
      cost: (json['cost'] as num).toInt(),
      fuelRefile: (json['fuelRefile'] as num).toInt(),
    );

Map<String, dynamic> _$FaultReportModelToJson(FaultReportModel instance) =>
    <String, dynamic>{
      'faultType': instance.faultType,
      'address': instance.address,
      'details': instance.details,
      'cost': instance.cost,
      'fuelRefile': instance.fuelRefile,
    };
