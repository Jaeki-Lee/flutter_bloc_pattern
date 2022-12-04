part of 'restaurant_bloc.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();
}

class SubmitRestaurantQueryEvent extends RestaurantEvent {
  final String query;
  final Location location;

  const SubmitRestaurantQueryEvent(this.query, this.location);

  @override
  List<Object?> get props => throw UnimplementedError();
}
