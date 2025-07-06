import 'package:json_annotation/json_annotation.dart';

import 'part_model.dart';
part 'start_repair_model.g.dart';

@JsonSerializable()
class StartRepairModel {
  final String notes;
  final String expectedFinishDate;
  final String maintenanceRequestId;
  final List<PartModel> parts;

  StartRepairModel({
    required this.notes,
    required this.expectedFinishDate,
    required this.maintenanceRequestId,
    required this.parts,
  });

  factory StartRepairModel.fromJson(Map<String, dynamic> json) =>
      _$StartRepairModelFromJson(json);

  Map<String, dynamic> toJson() => _$StartRepairModelToJson(this);
}

@JsonSerializable()
class GetPartsModel  {
  final List<PartModel>? parts;

  GetPartsModel({required this.parts});

  factory GetPartsModel.fromJson(Map<String, dynamic> json) =>
      _$GetPartsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPartsModelToJson(this);
}
