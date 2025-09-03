import "dart:convert";
import "package:ceia_comigo/models/user_session.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import '../services/api_service.dart';

class UserSessionService {
  Future<UserSessionResponse> loginUserSession(
    String email,
    String password,
  ) async {
    debugPrint("loginUserClient API CALL");
    debugPrint("Email: $email Password $password");
    final apiUrl = ApiService.url;
    final url = Uri.parse('$apiUrl/auth/login');
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
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserSessionResponse(
        code: response.statusCode,
        userSession: UserSession.fromJson(data),
      );
    } else {
      return UserSessionResponse(code: response.statusCode);
    }
  }
}

class UserSessionResponse {
  int code;
  UserSession? userSession;
  UserSessionResponse({required this.code, this.userSession});
}
