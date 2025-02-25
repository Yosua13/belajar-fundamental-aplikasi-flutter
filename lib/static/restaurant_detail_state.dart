import 'package:restaurant_app/data/model/restaurant_detail_response.dart';
import 'package:restaurant_app/data/model/restaurant_review_response.dart'
    as review;

sealed class RestaurantDetailState {}

class RestaurantDetailNoneState extends RestaurantDetailState {}

class RestaurantDetailLoadingState extends RestaurantDetailState {}

class RestaurantDetailErrorState extends RestaurantDetailState {
  final String error;

  RestaurantDetailErrorState(this.error);
}

class RestaurantDetailLoadedState extends RestaurantDetailState {
  final RestaurantDetail data;

  RestaurantDetailLoadedState(this.data);
}

class RestaurantReviewLoadingState extends RestaurantDetailState {}

class RestaurantReviewSuccessState extends RestaurantDetailState {
  List<review.CustomerReview> reviews;

  RestaurantReviewSuccessState(this.reviews);
}

class RestaurantReviewErrorState extends RestaurantDetailState {
  final String error;

  RestaurantReviewErrorState(this.error);
}
