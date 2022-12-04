part of 'restaurant_bloc.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();
}

class RestaurantInitState extends RestaurantState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class RestaurantLoading extends RestaurantState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class RestaurantLoaded extends RestaurantState {
  final List<Restaurant> restaurantList;

  const RestaurantLoaded(this.restaurantList);

  @override
  List<Object?> get props => [restaurantList];
}

class RestaurantLoadError extends RestaurantState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
