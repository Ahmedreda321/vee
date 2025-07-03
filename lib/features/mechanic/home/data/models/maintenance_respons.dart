import 'package:json_annotation/json_annotation.dart';

part 'maintenance_respons.g.dart';

@JsonSerializable()
class MaintenanceResponse {
  final String? id;
  final String? description;
  final String? status;
  final ManagerResponse? manager;
  final MechanicResponse? mechanic;
  final VehicleResponse? vehicle;
  final String? maintenaceCategory;
  MaintenanceResponse({
    this.id,
    this.description,
    this.status,
    this.manager,
    this.mechanic,
    this.vehicle,
    required this.maintenaceCategory,
  });
  factory MaintenanceResponse.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceResponseFromJson(json);
}


@JsonSerializable()

class ManagerResponse {
  final String? id;
  final String? role;
  final String? displayName;
  final String? phoneNumber;

  ManagerResponse({
    required this.id,
    required this.role,
    required this.displayName,
    required this.phoneNumber,
  });
  factory ManagerResponse.fromJson(Map<String, dynamic> json) =>
      _$ManagerResponseFromJson(json);
}

@JsonSerializable()

class MechanicResponse {
  final String? id;
  final String? role;
  final String? displayName;
  final String? phoneNumber;

  MechanicResponse({
    required this.id,
    required this.role,
    required this.displayName,
    required this.phoneNumber,
  });
  factory MechanicResponse.fromJson(Map<String, dynamic> json) =>
      _$MechanicResponseFromJson(json);
}

@JsonSerializable()
class VehicleResponse {
  final String? id;
  final String? name;
  final String? palletNumber;
  final String? joinedYear;
  final int? modelYear;
  final String? status;
  final String? lastAssignedDate;
  final String? category;

  VehicleResponse({
    required this.id,
    required this.name,
    required this.palletNumber,
    required this.joinedYear,
    required this.modelYear,
    required this.status,
    required this.lastAssignedDate,
    required this.category,
  });

  factory VehicleResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleResponseFromJson(json);
}
