// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverHomeResponse _$DriverHomeResponseFromJson(Map<String, dynamic> json) =>
    DriverHomeResponse(
      json['message'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      trips: (json['tripRequests'] as List<dynamic>?)
          ?.map((e) => TripResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DriverHomeResponseToJson(DriverHomeResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'tripRequests': instance.trips,
    };
