import 'package:ceia_comigo/models/restaraunt.dart';
import 'package:ceia_comigo/services/restaurant_services.dart';
import 'package:flutter/widgets.dart';

class RestaurantViewmodel extends ChangeNotifier {
  final RestaurantServices _service = RestaurantServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Restaurant> _restaurants = [];
  List<Restaurant> get restaurants => _restaurants;

  Future<void> fetchRestaurants({int offset = 0, int limit = 20}) async {
    if (!isLoading) {
      _isLoading = true;
      notifyListeners();
      try {
        _restaurants = await _service.getRestaurants(
          offset: offset,
          limit: limit,
        );
      } catch (e) {
        debugPrint("Could not fetch restaurants");
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
  }
}
