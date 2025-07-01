// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      mustChangePassword: json['mustChangePassword'] as bool?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      bussinessUserDto: json['bussinessUser'] == null
          ? null
          : BusinessUserDto.fromJson(
              json['bussinessUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'mustChangePassword': instance.mustChangePassword,
      'email': instance.email,
      'token': instance.token,
      'bussinessUser': instance.bussinessUserDto,
    };
