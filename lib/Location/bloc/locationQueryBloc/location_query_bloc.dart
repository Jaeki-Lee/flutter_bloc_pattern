import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_finder/Location/models/location.dart';
import 'package:restaurant_finder/Location/repository/location_repository_imp.dart';
import 'package:restaurant_finder/Location/usecase/get_location_usecase.dart';

part 'location_query_event.dart';
part 'location_query_state.dart';

class LocationQueryBloc extends Bloc<LocationQueryEvent, LocationQueryState> {
  final GetLocationUseCase _getLocationUseCase;

  LocationQueryBloc(this._getLocationUseCase) : super(LocationQueryInitState());

  @override
  Stream<LocationQueryState> mapEventToState(LocationQueryEvent event) async* {
    if (event is SubmitQueryEvent) {
      yield* _submitQueryEventToLocationQueryState(event.query);
    }
  }

  Stream<LocationQueryState> _submitQueryEventToLocationQueryState(
      String query) async* {
    yield LocationLoading();

    try {
      final locationList = await _getLocationUseCase.call(query);
      yield LocationLoaded(locationList);
    } catch (_) {
      yield LocationLoadError();
    }
  }
}
