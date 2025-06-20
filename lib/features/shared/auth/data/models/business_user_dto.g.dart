// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessUserDto _$BusinessUserDtoFromJson(Map<String, dynamic> json) =>
    BusinessUserDto(
      id: json['id'] as String?,
      role: json['role'] as String?,
      displayName: json['displayName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$BusinessUserDtoToJson(BusinessUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'displayName': instance.displayName,
      'phoneNumber': instance.phoneNumber,
    };
