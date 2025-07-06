// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lcation_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LcationUpdateModel _$LcationUpdateModelFromJson(Map<String, dynamic> json) =>
    LcationUpdateModel(
      statusCode: (json['statusCode'] as num).toInt(),
      tripId: json['tripId'] as String,
      startLat: (json['startLat'] as num).toDouble(),
      startLng: (json['startLng'] as num).toDouble(),
      destinationLat: (json['destinationLat'] as num).toDouble(),
      destinationLng: (json['destinationLng'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      timestamp: json['timestamp'] as String,
      distance: (json['distance'] as num).toDouble(),
    );

Map<String, dynamic> _$LcationUpdateModelToJson(LcationUpdateModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'tripId': instance.tripId,
      'startLat': instance.startLat,
      'startLng': instance.startLng,
      'destinationLat': instance.destinationLat,
      'destinationLng': instance.destinationLng,
      'lat': instance.lat,
      'lng': instance.lng,
      'timestamp': instance.timestamp,
      'distance': instance.distance,
    };
