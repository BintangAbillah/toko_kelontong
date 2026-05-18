class RegisterModel {
  final String name;
  final String email;
  final String password;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
  });

  // Convert object ke JSON
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }

  // Convert JSON ke object
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
    );
  }
}