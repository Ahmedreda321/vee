// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mechanic_home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MechanicHomeResponse _$MechanicHomeResponseFromJson(
        Map<String, dynamic> json) =>
    MechanicHomeResponse(
      maintenances: (json['data'] as List<dynamic>)
          .map((e) => MaintenanceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MechanicHomeResponseToJson(
        MechanicHomeResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.maintenances,
    };
