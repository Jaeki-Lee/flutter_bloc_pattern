import 'dart:async';
import 'package:restaurant_finder/Location/models/location.dart';

import '../DataLayer/zomato_client.dart';
import '../Restaurant/models/restaurant.dart';

class RestaurantRepository {
  ZomatoClient _client = ZomatoClient();

  Future<List<Restaurant>> submitQuery(Location location, String query) async {
    List<Restaurant> restaurantList =
        await _client.fetchRestaurants(location, query);

    return restaurantList;
  }
}
