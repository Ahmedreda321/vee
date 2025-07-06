import 'package:json_annotation/json_annotation.dart';
import 'part_model.dart';
part 'finish_repair_model.g.dart';

@JsonSerializable()
class FinishRepairModel {
  final String initialReportId;
  final String notes;
  final List<PartModel> changedParts;

  FinishRepairModel({
    required this.initialReportId,
    required this.notes,
    required this.changedParts,
  });

  factory FinishRepairModel.fromJson(Map<String, dynamic> json) =>
      _$FinishRepairModelFromJson(json);

Map<String, dynamic> toJson() => {
  'initialReportId': initialReportId,
  'notes': notes,
  'changedParts': changedParts.map((part) => part.toJson()).toList(),
};}
