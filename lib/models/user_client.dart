class UserClient {
  int id;
  String name;

  UserClient({required this.id, required this.name});

  factory UserClient.fromJson(Map<String, dynamic> json) {
    return UserClient(id: json['id'], name: json['name']);
  }
}
