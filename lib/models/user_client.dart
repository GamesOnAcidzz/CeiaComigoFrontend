class UserClient {
  final int id;
  final String name;
  final String email;

  UserClient({required this.id, required this.name, required this.email});

  factory UserClient.fromJson(Map<String, dynamic> json) {
    return UserClient(id: json["id"], name: json["name"], email: json["email"]);
  }
}
