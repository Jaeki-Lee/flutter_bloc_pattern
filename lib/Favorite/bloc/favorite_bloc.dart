import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_finder/Repository/favorite_restaurant_repository.dart';
import 'package:restaurant_finder/Restaurant/models/restaurant.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRestaurantRepository favoriteRestaurantRepository =
      FavoriteRestaurantRepository();

  FavoriteBloc(FavoriteState initialState) : super(FaovriteInitState());

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is ToggleRestaurantEvent) {
      yield* _mapToggleRestaurantEventToState(event.restaurant);
    }
  }

  Stream<FavoriteState> _mapToggleRestaurantEventToState(
      Restaurant restaurant) async* {
    yield UpdatingRestaurant();
    try {
      List<Restaurant> restaurantList =
          favoriteRestaurantRepository.updateFavoriteRestaurant(restaurant);
      yield UpdatedRestaurant(restaurantList);
    } catch (e) {
      yield FailedUpdatingRestaurant();
    }
  }
}
