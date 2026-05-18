class LoginModel {
  final String email;
  final String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  // Convert object ke JSON
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

  // Convert JSON ke object
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json["email"] ?? "",
      password: json["password"] ?? "",
    );
  }
}