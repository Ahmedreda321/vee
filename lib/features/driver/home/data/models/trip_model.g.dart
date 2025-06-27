// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripResponse _$TripResponseFromJson(Map<String, dynamic> json) => TripResponse(
      pickupLocation: json['pickupLocation'] as String?,
      pickupLocationLatitude:
          (json['pickupLocationLatitude'] as num?)?.toDouble(),
      pickupLocationLongitude:
          (json['pickupLocationLongitude'] as num?)?.toDouble(),
      destinationLatitude: (json['destinationLatitude'] as num?)?.toDouble(),
      destinationLongitude: (json['destinationLongitude'] as num?)?.toDouble(),
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

Map<String, dynamic> _$TripResponseToJson(TripResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'managerId': instance.managerId,
      'details': instance.details,
      'destination': instance.destination,
      'tripType': instance.tripType,
      'date': instance.date,
      'driver': instance.driver,
      'vehicle': instance.vehicle,
      'status': instance.status,
      'pickupLocation': instance.pickupLocation,
      'pickupLocationLatitude': instance.pickupLocationLatitude,
      'pickupLocationLongitude': instance.pickupLocationLongitude,
      'destinationLatitude': instance.destinationLatitude,
      'destinationLongitude': instance.destinationLongitude,
    };

TripDriverResponse _$TripDriverResponseFromJson(Map<String, dynamic> json) =>
    TripDriverResponse(
      id: json['id'] as String?,
      name: json['displayName'] as String?,
    );

Map<String, dynamic> _$TripDriverResponseToJson(TripDriverResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.name,
    };

VehicleResponse _$VehicleResponseFromJson(Map<String, dynamic> json) =>
    VehicleResponse(
      id: json['id'] as String?,
      palletNumber: json['palletNumber'] as String?,
      vehicleModelDto: json['vehicleModelDto'] == null
          ? null
          : VehicleModelDtoResponse.fromJson(
              json['vehicleModelDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleResponseToJson(VehicleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'palletNumber': instance.palletNumber,
      'vehicleModelDto': instance.vehicleModelDto,
    };

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

Map<String, dynamic> _$VehicleModelDtoResponseToJson(
        VehicleModelDtoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fuelEfficiency': instance.fuelEfficiency,
      'brand': instance.brand,
      'category': instance.category,
    };

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

BrandResponse _$BrandResponseFromJson(Map<String, dynamic> json) =>
    BrandResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$BrandResponseToJson(BrandResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
    };
