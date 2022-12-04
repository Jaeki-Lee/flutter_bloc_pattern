part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FaovriteInitState extends FavoriteState {
  
  @override
  List<Object> get props => throw UnimplementedError();
  
}

class UpdatingRestaurant extends FavoriteState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdatedRestaurant extends FavoriteState {
  final List<Restaurant> favoriteRestaurantList;

  const UpdatedRestaurant(this.favoriteRestaurantList);

  @override
  List<Object> get props => [favoriteRestaurantList];
}

class FailedUpdatingRestaurant extends FavoriteState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
