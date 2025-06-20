class LoginEntity {
  final bool mustChangePassword;
  final String email;
  final String token;
  final BusinessUserEntity? businessUser;

  LoginEntity({
    required this.mustChangePassword,
    required this.email,
    required this.token,
    required this.businessUser,
  });
}

class BusinessUserEntity {
  final String id;
  final String role;
  final String displayName;
  final String phoneNumber;

  BusinessUserEntity({
    required this.id,
    required this.role,
    required this.displayName,
    required this.phoneNumber,
  });
}