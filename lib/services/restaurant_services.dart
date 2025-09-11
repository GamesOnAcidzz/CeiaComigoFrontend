import 'dart:convert';

import 'package:ceia_comigo/models/restaraunt.dart';
import 'package:ceia_comigo/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class RestaurantServices {
  Future<List<Restaurant>> getRestaurants({
    int offset = 0,
    int limit = 20,
  }) async {
    final apiUrl = ApiService.url;
    final url = Uri.parse(
      '$apiUrl/restaurants/all?offset=$offset&limit=$limit',
    );
    debugPrint('ApiUrl: $url');
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> restaurantList = data['restaurants'];
      debugPrint(restaurantList.toString());
      return restaurantList.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      throw Exception('Failed to retrieve restaurants');
    }
  }
}
