import 'package:submission1_restaurant_app/data/api/api_service.dart';
import 'package:submission1_restaurant_app/data/model/restaurant_list.dart';
import 'package:flutter/material.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantListProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantListProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  late RestaurantList _restaurantList;
  late ResultState _state;
  String _message = "";

  RestaurantList get restaurantList => _restaurantList;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final result = await apiService.listRestaurant();
      if (result.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantList = result;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error : $e';
    }
  }
}
