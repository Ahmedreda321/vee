// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripResponse _$TripResponseFromJson(Map<String, dynamic> json) => TripResponse(
      id: json['id'] as String?,
      managerId: json['managerId'] as String?,
      details: json['details'] as String?,
      destination: json['destination'] as String?,
      tripType: json['tripType'] as String?,
      date: json['date'] as String?,
      driver: json['driver'] == null
          ? null
          : TripDriverResponse.fromJson(json['driver'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : VehicleResponse.fromJson(json['vehicle'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );


TripDriverResponse _$TripDriverResponseFromJson(Map<String, dynamic> json) =>
    TripDriverResponse(
      id: json['id'] as String?,
      name: json['displayName'] as String?,
    );


VehicleResponse _$VehicleResponseFromJson(Map<String, dynamic> json) =>
    VehicleResponse(
      id: json['id'] as String?,
      palletNumber: json['palletNumber'] as String?,
      vehicleModelDto: json['vehicleModelDto'] == null
          ? null
          : VehicleModelDtoResponse.fromJson(
              json['vehicleModelDto'] as Map<String, dynamic>),
    );


VehicleModelDtoResponse _$VehicleModelDtoResponseFromJson(
        Map<String, dynamic> json) =>
    VehicleModelDtoResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      fuelEfficiency: json['fuelEfficiency'] as String?,
      brand: json['brand'] == null
          ? null
          : BrandResponse.fromJson(json['brand'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryResponse.fromJson(json['category'] as Map<String, dynamic>),
    );


CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );


BrandResponse _$BrandResponseFromJson(Map<String, dynamic> json) =>
    BrandResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
    );

