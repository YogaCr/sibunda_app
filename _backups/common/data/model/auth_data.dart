class SignUpData {
  final String name;
  final String email;
  final String password;

  const SignUpData({
    required this.name,
    required this.email,
    required this.password,
  });
}

class LoginData {
  final String email;
  final String password;

  const LoginData({
    required this.email,
    required this.password,
  });
}

class SessionData {
  final String token;
  const SessionData(this.token);
}