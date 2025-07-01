import 'package:json_annotation/json_annotation.dart';

part 'base_data_source.g.dart';

@JsonSerializable()
class BaseResponse {
  final int? statusCode;
  final String? message;
  const BaseResponse({
    this.statusCode,
    this.message,
  });
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}
