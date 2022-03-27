import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:submission1_restaurant_app/data/model/detail_restaurant.dart';
import 'package:submission1_restaurant_app/data/model/restaurant_list.dart';
import 'package:submission1_restaurant_app/data/model/detail_restaurant.dart';
import 'package:submission1_restaurant_app/data/model/search_restaurant.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  // static final String _apiKey = 'YOUR_API_KEY';
  // static final String _category = 'business';
  // static final String _country = 'id';

  // Future<RestaurantResult> allRestaurant() async {
  //   final response = await http.get(Uri.parse(_baseUrl + "list"));
  //   if (response.statusCode == 200) {
  //     return RestaurantResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load top headlines');
  //   }
  // }

  Future<RestaurantList> listRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return RestaurantList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<RestaurantResult> detailRestaurant(String idRestaurant) async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<SearchRestaurant> searchRestaurant(String key) async {
    final response = await http.get(Uri.parse(_baseUrl + "search?q=" + key));
    if (response.statusCode == 200) {
      return SearchRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load search restaurant');
    }
  }
}
