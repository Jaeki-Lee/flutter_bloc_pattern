import 'package:restaurant_finder/Restaurant/models/restaurant.dart';

class FavoriteRestaurantRepository {
  List<Restaurant> _favoriteRestaurantList = [];

  List<Restaurant> updateFavoriteRestaurant(Restaurant restaurant) {
    bool isContain = _favoriteRestaurantList.contains(restaurant);

    if (isContain) {
      _favoriteRestaurantList.remove(restaurant);
    } else {
      _favoriteRestaurantList.add(restaurant);
    }

    return _favoriteRestaurantList;
  }
}
