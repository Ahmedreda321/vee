// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      mustChangePassword: json['mustChangePassword'] as bool,
      email: json['email'] as String,
      token: json['token'] as String,
      bussinessUserDto: BusinessUserDto.fromJson(
          json['bussinessUserDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'mustChangePassword': instance.mustChangePassword,
      'email': instance.email,
      'token': instance.token,
      'bussinessUserDto': instance.bussinessUserDto,
    };
