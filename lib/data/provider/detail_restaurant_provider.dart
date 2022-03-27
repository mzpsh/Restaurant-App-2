import 'package:flutter/material.dart';

import 'package:submission1_restaurant_app/data/api/api_service.dart';
import 'package:submission1_restaurant_app/data/model/detail_restaurant.dart';

enum ResultState { Loading, NoData, HasData, Error }

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String idRestaurant;

  DetailRestaurantProvider({
    required this.apiService,
    required this.idRestaurant,
  }) {
    _fetchDetailRestaurant();
  }

  late RestaurantResult _detailRestaurant;
  late ResultState _state;
  String _message = "";

  RestaurantResult get detailRestaurant => _detailRestaurant;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchDetailRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final result = await apiService.detailRestaurant(idRestaurant);
      if (result.restaurant.name == null) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _detailRestaurant = result;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error : $e';
    }
  }
}
