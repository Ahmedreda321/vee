import 'package:json_annotation/json_annotation.dart';
import 'business_user_dto.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool mustChangePassword;
  final String email;
  final String token;
  final BusinessUserDto bussinessUserDto;

  LoginResponse({
    required this.mustChangePassword,
    required this.email,
    required this.token,
    required this.bussinessUserDto,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
