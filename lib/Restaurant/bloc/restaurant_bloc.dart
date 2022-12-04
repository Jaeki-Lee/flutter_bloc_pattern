import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_finder/Location/models/location.dart';
import 'package:restaurant_finder/Repository/restaurant_repository.dart';
import 'package:restaurant_finder/Restaurant/models/restaurant.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final resaurantRepository = RestaurantRepository();

  RestaurantBloc(RestaurantState initialState) : super(initialState);

  @override
  Stream<RestaurantState> mapEventToState(RestaurantEvent event) async* {
    if (event is SubmitRestaurantQueryEvent) {
      yield* _mapSubmitQueryEventToState(event.query, event.location);
    }
  }

  Stream<RestaurantState> _mapSubmitQueryEventToState(
      String query, Location location) async* {
    yield RestaurantLoading();

    try {
      List<Restaurant> restaurantList =
          await resaurantRepository.submitQuery(location, query);
      yield RestaurantLoaded(restaurantList);
    } catch (e) {
      yield RestaurantLoadError();
    }
  }
}
