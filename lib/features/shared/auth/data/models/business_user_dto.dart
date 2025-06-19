import 'package:json_annotation/json_annotation.dart';

part 'business_user_dto.g.dart';

@JsonSerializable()
class BusinessUserDto {
  final String id;
  final String role;
  final String displayName;
  final String phoneNumber;

  BusinessUserDto({
    required this.id,
    required this.role,
    required this.displayName,
    required this.phoneNumber,
  });

  factory BusinessUserDto.fromJson(Map<String, dynamic> json) =>
      _$BusinessUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessUserDtoToJson(this);
}
