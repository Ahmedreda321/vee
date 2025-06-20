class ResetPasswordEntity {
  final String email;
  final String token;
  final String newPassword;

  const ResetPasswordEntity({
    required this.email,
    required this.token,
    required this.newPassword,
  });
}
