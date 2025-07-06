// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartModel _$PartModelFromJson(Map<String, dynamic> json) => PartModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      cost: (json['cost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PartModelToJson(PartModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'cost': instance.cost,
    };
