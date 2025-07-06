// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/models/base_data_source.dart';
import 'maintenance_respons.dart';

part 'mechanic_home_response.g.dart';

@JsonSerializable()
class MechanicHomeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  final List<MaintenanceResponse> maintenances;
  MechanicHomeResponse({required this.maintenances, super.statusCode});

  factory MechanicHomeResponse.fromJson(Map<String, dynamic> json) =>
      _$MechanicHomeResponseFromJson(json);
}
