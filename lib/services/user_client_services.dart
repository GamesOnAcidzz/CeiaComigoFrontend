import "dart:convert";
import "package:flutter/material.dart";
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
    debugPrint("validateUserClientLogin API CALL");
    debugPrint("Email: $email Password $password");
    final apiUrl = ApiService.url;
    final url = Uri.parse('$apiUrl/userClients/validateUserClientLogin');
    debugPrint(url.toString());
    final body = {'email': email, 'password': password};
    debugPrint("Body: $body");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    debugPrint("Status code: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");
    UserClientValidation code = UserClientValidation.wrongEmail;
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint(data["isValid"]);
      String isValid = data['isValid'];
      if (isValid == "true") {
        code = UserClientValidation.validPassword;
      } else {
        code = UserClientValidation.invalidPassword;
      }
    }
    return code;
  }
}
