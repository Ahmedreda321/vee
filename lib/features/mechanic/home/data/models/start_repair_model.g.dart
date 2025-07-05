// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_repair_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartRepairModel _$StartRepairModelFromJson(Map<String, dynamic> json) =>
    StartRepairModel(
      notes: json['notes'] as String,
      expectedFinishDate: json['expectedFinishDate'] as String,
      maintenanceRequestId: json['maintenanceRequestId'] as String,
      parts: (json['parts'] as List<dynamic>)
          .map((e) => PartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StartRepairModelToJson(StartRepairModel instance) =>
    <String, dynamic>{
      'notes': instance.notes,
      'expectedFinishDate': instance.expectedFinishDate,
      'maintenanceRequestId': instance.maintenanceRequestId,
      'parts': instance.parts,
    };

GetPartsModel _$GetPartsModelFromJson(Map<String, dynamic> json) =>
    GetPartsModel(
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => PartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPartsModelToJson(GetPartsModel instance) =>
    <String, dynamic>{
      'parts': instance.parts,
    };
