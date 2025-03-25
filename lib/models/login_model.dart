class LoginModel {
  final String userName;
  final String email;
  final String token;
  final String role;

  LoginModel({
    required this.userName,
    required this.email,
    required this.token,
    required this.role,
  });

  factory LoginModel.fromjson(jsonData) {
    return LoginModel(
        userName: jsonData['userName'],
        email: jsonData['email'],
        token: jsonData['token'],
        role: jsonData['role']);
  }
}
