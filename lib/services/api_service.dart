class ApiService {
  static final ApiService _instance = ApiService._internal();
  static const url = "http://10.0.2.2:3000/api";
  factory ApiService() {
    return _instance;
  }

  ApiService._internal();
}
