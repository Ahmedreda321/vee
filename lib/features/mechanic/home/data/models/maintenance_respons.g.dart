// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_respons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceResponse _$MaintenanceResponseFromJson(Map<String, dynamic> json) =>
    MaintenanceResponse(
      id: json['id'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      manager: json['manager'] == null
          ? null
          : ManagerResponse.fromJson(json['manager'] as Map<String, dynamic>),
      mechanic: json['mechanic'] == null
          ? null
          : MechanicResponse.fromJson(json['mechanic'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : VehicleResponse.fromJson(json['vehicle'] as Map<String, dynamic>),
      maintenaceCategory: json['maintenaceCategory'] as String?,
    );

Map<String, dynamic> _$MaintenanceResponseToJson(
        MaintenanceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'status': instance.status,
      'manager': instance.manager,
      'mechanic': instance.mechanic,
      'vehicle': instance.vehicle,
      'maintenaceCategory': instance.maintenaceCategory,
    };

ManagerResponse _$ManagerResponseFromJson(Map<String, dynamic> json) =>
    ManagerResponse(
      id: json['id'] as String?,
      role: json['role'] as String?,
      displayName: json['displayName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$ManagerResponseToJson(ManagerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'displayName': instance.displayName,
      'phoneNumber': instance.phoneNumber,
    };

MechanicResponse _$MechanicResponseFromJson(Map<String, dynamic> json) =>
    MechanicResponse(
      id: json['id'] as String?,
      role: json['role'] as String?,
      displayName: json['displayName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$MechanicResponseToJson(MechanicResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'displayName': instance.displayName,
      'phoneNumber': instance.phoneNumber,
    };

VehicleResponse _$VehicleResponseFromJson(Map<String, dynamic> json) =>
    VehicleResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      palletNumber: json['palletNumber'] as String?,
      joinedYear: json['joinedYear'] as String?,
      modelYear: (json['modelYear'] as num?)?.toInt(),
      status: json['status'] as String?,
      lastAssignedDate: json['lastAssignedDate'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$VehicleResponseToJson(VehicleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'palletNumber': instance.palletNumber,
      'joinedYear': instance.joinedYear,
      'modelYear': instance.modelYear,
      'status': instance.status,
      'lastAssignedDate': instance.lastAssignedDate,
      'category': instance.category,
    };
