// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_repair_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishRepairModel _$FinishRepairModelFromJson(Map<String, dynamic> json) =>
    FinishRepairModel(
      initialReportId: json['initialReportId'] as String,
      notes: json['notes'] as String,
      changedParts: (json['changedParts'] as List<dynamic>)
          .map((e) => PartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FinishRepairModelToJson(FinishRepairModel instance) =>
    <String, dynamic>{
      'initialReportId': instance.initialReportId,
      'notes': instance.notes,
      'changedParts': instance.changedParts,
    };
