class LoginResponse {
  final String status;
  final String accessToken;

  LoginResponse({
    required this.status,
    required this.accessToken,
  });

  static LoginResponse fromJson(json) {
    return LoginResponse(
      status: json['status'],
      accessToken: json['accessToken'],
    );
  }
}
