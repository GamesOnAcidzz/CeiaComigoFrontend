import "dart:convert";
import "package:http/http.dart" as http;
import "../models/user_client.dart";
import '../services/api_service.dart';

enum UserClientValidation { wrongEmail, validPassword, invalidPassword }

class UserClientApiService {
  Future<List<UserClient>> getUserClients() async {
    final http.Response response = await http.get(
      Uri.parse("$ApiService.url/userClients/"),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => UserClient.fromJson(json)).toList();
    } else {
      throw Exception("Failed to get UserClients data");
    }
  }

  Future<UserClientValidation> validateUserClientLogin(
    String email,
    String password,
  ) async {
    final url = Uri.parse('$ApiService.url/validateUserClientLogin');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'email': email, 'password': password}),
    );
    print(url);
    switch (response.statusCode) {
      case 200:
        final data = jsonDecode(response.body);
        bool isValid = data['isValid'];
        if (isValid) {
          return UserClientValidation.validPassword;
        } else {
          return UserClientValidation.invalidPassword;
        }
      case 406:
        return UserClientValidation.wrongEmail;
      default:
        throw Exception("Failed to retrieve email validation");
    }
  }
}
