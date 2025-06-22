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
  @override
  String toString() {
    return 'LoginEntity(mustChangePassword: $mustChangePassword, email: $email, token: $token, businessUser: $businessUser)';
  }
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
  @override
  String toString() {
    return 'BusinessUserEntity(id: $id, role: $role, displayName: $displayName, phoneNumber: $phoneNumber)';
  }
}