import 'package:json_annotation/json_annotation.dart';
import 'business_user_dto.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final int? statusCode;
  final String? message;
  final bool? mustChangePassword;
  final String? email;
  final String? token;
  @JsonKey(name: 'bussinessUser')
  final BusinessUserDto? bussinessUserDto;

  LoginResponse({
    this.statusCode,
    this.message,
    this.mustChangePassword,
    this.email,
    this.token,
    this.bussinessUserDto,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse{statusCode: $statusCode, message: $message, mustChangePassword: $mustChangePassword, email: $email, token: $token, bussinessUserDto: $bussinessUserDto}';
  }
}
