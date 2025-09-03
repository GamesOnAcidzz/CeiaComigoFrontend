import 'package:ceia_comigo/models/user_session.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/user_session_services.dart';

class UserSessiontViewmodel extends ChangeNotifier {
  final UserSessionService _userSessionService = UserSessionService();
  UserSession? _userSession;
  UserSession? get userSession => _userSession;

  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<UserSessionResponse> loginUserSession(
    String email,
    String password,
  ) async {
    _isLoading = true;
    _error = null;

    final result = await _userSessionService.loginUserSession(email, password);
    if (result.userSession != null) {
      _userSession = result.userSession;
      await _saveToken(result.userSession!.token);
      notifyListeners();
    }
    return result;
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getSavedToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
