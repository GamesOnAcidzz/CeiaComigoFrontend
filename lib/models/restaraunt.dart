import 'package:ceia_comigo/models/group.dart';

class Restaurant {
  String id;
  String name;
  List<Group>? groups;
  Restaurant({required this.id, required this.name, this.groups});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(id: json['_id'], name: json['name']);
  }
}
