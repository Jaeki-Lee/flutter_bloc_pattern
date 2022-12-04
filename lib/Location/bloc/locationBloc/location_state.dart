part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
}

class LocationInitState extends LocationState {
  @override
  List<Object?> get props => throw UnimplementedError();
  
}

class SelectedLocation extends LocationState {
  final Location location;

  const SelectedLocation(this.location);

  @override
  List<Object?> get props => [location];
}
