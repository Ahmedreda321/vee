import 'package:json_annotation/json_annotation.dart';
part 'part_model.g.dart';

@JsonSerializable()
class PartModel {
  final String? id;
  final String? name;
  final int? quantity;
  final double? cost;

  PartModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.cost,
  });

  factory PartModel.fromJson(Map<String, dynamic> json) =>
      _$PartModelFromJson(json);
  Map<String, dynamic> toJson() => {
    'partId': id, // تحويل id إلى partId هنا
    'quantity': quantity,
  };}
