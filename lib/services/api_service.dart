class ApiService {
  static final ApiService _instance = ApiService._internal();
  static const url = "http://localhost:3000/api";
  factory ApiService() {
    return _instance;
  }

  ApiService._internal();
}
