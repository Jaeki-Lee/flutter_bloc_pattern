part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class ToggleRestaurantEvent extends FavoriteEvent {
  final Restaurant restaurant;

  const ToggleRestaurantEvent(this.restaurant);

  @override
  List<Object?> get props => throw UnimplementedError();
}
