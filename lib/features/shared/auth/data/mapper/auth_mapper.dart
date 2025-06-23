import '../../domain/entities/forgot_password_entity.dart';
import '../../domain/entities/login_entity.dart';
import '../models/business_user_dto.dart';
import '../models/login_response.dart';

extension LoginMapper on LoginResponse {
  LoginEntity toDomain() {
    return LoginEntity(
      email: email ?? '',
      token: token ?? '',
      mustChangePassword: mustChangePassword ?? false,
      businessUser: bussinessUserDto?.toDomain(), 
    );
  }
}

extension BusinessUserMapper on BusinessUserDto {
  BusinessUserEntity toDomain() {
    return BusinessUserEntity(
      id: id?? '',
      role: role ?? '',
      displayName: displayName ?? '',
      phoneNumber: phoneNumber ?? '',
    );
  }
}

extension ForgotPasswordMapper on String? {
  ForgotPasswordEntity toDomain() {
    return ForgotPasswordEntity(
      message: this ?? 'An error occurred while processing your request.',
    );
  }
}