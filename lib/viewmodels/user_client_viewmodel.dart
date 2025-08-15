import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import '../models/user_client.dart';
import '../services/user_client_services.dart';

class UserClientViewmodel extends ChangeNotifier {
  final UserClientApiService _apiService = UserClientApiService();
  List<UserClient> _userClients = [];
  bool _isLoading = false;
  String? _error;

  List<UserClient> get userClients => _userClients;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getUserClients() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _userClients = await _apiService.getUserClients();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<UserClientValidation> validateUserClient(
    String email,
    String password,
  ) async {
    _isLoading = true;
    _error = null;

    final response = await _apiService.validateUserClientLogin(email, password);
    debugPrint("Code:  $response");
    return response;
  }
}
