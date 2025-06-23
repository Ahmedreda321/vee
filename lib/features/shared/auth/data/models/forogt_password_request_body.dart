import 'package:json_annotation/json_annotation.dart';
part 'forogt_password_request_body.g.dart';

@JsonSerializable()
class ForgotPasswordRequestBody {
  String email;

  ForgotPasswordRequestBody({required this.email});

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestBodyToJson(this);
}
