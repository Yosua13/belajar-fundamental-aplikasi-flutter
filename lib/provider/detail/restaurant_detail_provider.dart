import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/static/restaurant_detail_state.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantDetailProvider(
    this._apiServices,
  );

  RestaurantDetailState _resultState = RestaurantDetailNoneState();

  RestaurantDetailState get resultState => _resultState;

  Future<void> fetchRestaurantDetail(String id) async {
    try {
      _resultState = RestaurantDetailLoadingState();
      notifyListeners();

      final result = await _apiServices.getRestaurantDetail(id);

      if (result.error) {
        _resultState = RestaurantDetailErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = RestaurantDetailLoadedState(result.restaurant);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = RestaurantDetailErrorState(e.toString());
      notifyListeners();
    }
  }

  Future<void> addReview(String id, String name, String review) async {
    try {
      _resultState = RestaurantReviewLoadingState();
      notifyListeners();

      final response = await _apiServices.addRestaurantReview(id, name, review);

      if (response.error) {
        _resultState = RestaurantReviewErrorState(response.message);
        notifyListeners();
      } else {
        _resultState = RestaurantReviewSuccessState(response.customerReviews);
        notifyListeners();
      }
    } catch (e) {
      _resultState = RestaurantReviewErrorState(e.toString());
      notifyListeners();
    }
  }
}
