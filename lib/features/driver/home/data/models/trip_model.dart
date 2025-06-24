import 'package:json_annotation/json_annotation.dart';

part 'trip_model.g.dart';

@JsonSerializable()
class TripResponse {
  final String? id;
  final String? managerId;
  final String? details;
  final String? destination;
  final String? tripType;
  final String? date;
  final TripDriverResponse? driver;
  final VehicleResponse? vehicle;
  final String? status;

  const TripResponse({
    this.id,
    this.managerId,
    this.details,
    this.destination,
    this.tripType,
    this.date,
    this.driver,
    this.vehicle,
    this.status,
  });
  factory TripResponse.fromJson(Map<String, dynamic> json) =>
      _$TripResponseFromJson(json);
}

@JsonSerializable()
class TripDriverResponse {
  final String? id;
  @JsonKey(name: 'displayName')
  final String? name;

  const TripDriverResponse({
    this.id,
    this.name,
  });

  factory TripDriverResponse.fromJson(Map<String, dynamic> json) =>
      _$TripDriverResponseFromJson(json);
}

@JsonSerializable()
class VehicleResponse {
  final String? id;
  final String? palletNumber;
  final VehicleModelDtoResponse? vehicleModelDto;
  const VehicleResponse({
    this.id,
    this.palletNumber,
    this.vehicleModelDto,
  });

  factory VehicleResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleResponseFromJson(json);
}

@JsonSerializable()
class VehicleModelDtoResponse {
  final String? id;
  final String? name;
  final String? fuelEfficiency;
  final BrandResponse? brand;
  final CategoryResponse? category;

  const VehicleModelDtoResponse({
    this.id,
    this.name,
    this.fuelEfficiency,
    this.brand,
    this.category,
  });
  factory VehicleModelDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelDtoResponseFromJson(json);
}

@JsonSerializable()
class CategoryResponse {
  final String? id;
  final String? name;
  final String? description;

  const CategoryResponse({
    this.id,
    this.name,
    this.description,
  });
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}

@JsonSerializable()
class BrandResponse {
  final String? id;
  final String? name;
  final String? country;

  const BrandResponse({
    this.id,
    this.name,
    this.country,
  });
  factory BrandResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseFromJson(json);
}
