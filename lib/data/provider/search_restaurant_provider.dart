import 'package:flutter/cupertino.dart';

import 'package:submission1_restaurant_app/data/api/api_service.dart';
import 'package:submission1_restaurant_app/data/model/search_restaurant.dart';

enum ResultState { Loading, NoData, HasData, Error, NoKey }

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchRestaurantProvider({required this.apiService}) {
    _fetchSearchRestaurant();
  }

  late SearchRestaurant _searchRestaurant;
  late ResultState _state;
  String _message = "";
  String key = "";

  SearchRestaurant get searchRestaurant => _searchRestaurant;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchSearchRestaurant() async {
    if (key != "") {
      try {
        _state = ResultState.Loading;
        notifyListeners();
        final result = await apiService.searchRestaurant(key);
        if (result.restaurants.isEmpty) {
          _state = ResultState.NoData;
          notifyListeners();
          return _message = 'Empty Data';
        } else {
          _state = ResultState.HasData;
          notifyListeners();
          return _searchRestaurant = result;
        }
      } catch (e) {
        _state = ResultState.Error;
        notifyListeners();
        return _message = 'Error : $e';
      }
    } else {
      _state = ResultState.NoKey;
      notifyListeners();
      return _message = 'No Key';
    }
  }

  void addSearchKey(String key) {
    this.key = key;
    _fetchSearchRestaurant();
    notifyListeners();
  }
}
