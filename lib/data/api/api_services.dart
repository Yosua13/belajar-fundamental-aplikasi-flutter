import 'dart:convert';

import 'package:restaurant_app/data/model/restaurant_detail_response.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_review_response.dart';
import 'package:restaurant_app/data/model/restaurant_search_response.dart';

class ApiServices {
  static const _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantListResponse> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Restaurant List');
    }
  }

  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Restaurant Detail');
    }
  }

  Future<RestaurantSearchResponse> getRestaurantSearch(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl/search?$query"));

    if (response.statusCode == 200) {
      return RestaurantSearchResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to search item');
    }
  }

  Future<RestaurantReviewResponse> getRestaurantAddReview(
    String id,
    String name,
    String review,
  ) async {
    final url = Uri.parse("$_baseUrl/review");
    final response = await http.post(
      url,
      body: {
        "id": id,
        "name": name,
        "review": review,
      },
    );

    if (response.statusCode == 200) {
      return RestaurantReviewResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add review');
    }
  }
}
