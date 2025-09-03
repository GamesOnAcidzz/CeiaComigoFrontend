class UserSession {
  final String id;
  final String name;
  final String email;
  final String token;

  UserSession({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      token: json['token'],
      id: json["id"],
      name: json["name"],
      email: json["email"],
    );
  }
}
