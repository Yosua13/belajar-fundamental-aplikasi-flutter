import 'package:restaurant_app/data/model/restaurant_list.dart';

sealed class RestaurantListState {}

class RestaurantListNoneState extends RestaurantListState {}

class RestaurantListLoadingState extends RestaurantListState {}

class RestaurantListErrorState extends RestaurantListState {
  final String error;

  RestaurantListErrorState(this.error);
}

class RestaurantListLoadedState extends RestaurantListState {
  final List<RestaurantList> data;

  RestaurantListLoadedState(this.data);
}
