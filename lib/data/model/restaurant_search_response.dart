import 'package:restaurant_app/data/model/restaurant_list.dart';

class RestaurantSearchResponse {
  final bool error;
  final int founded;
  final List<RestaurantList> restaurants;

  RestaurantSearchResponse({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory RestaurantSearchResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantSearchResponse(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<RestaurantList>.from(
          json["restaurants"].map((x) => RestaurantList.fromJson(x)),
        ),
      );
}
