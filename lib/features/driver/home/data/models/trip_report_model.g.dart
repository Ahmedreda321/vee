// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripReportModel _$TripReportModelFromJson(Map<String, dynamic> json) =>
    TripReportModel(
      details: json['details'] as String,
      fuelRefile: (json['fuelRefile'] as num).toInt(),
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$TripReportModelToJson(TripReportModel instance) =>
    <String, dynamic>{
      'details': instance.details,
      'fuelRefile': instance.fuelRefile,
      'cost': instance.cost,
    };
