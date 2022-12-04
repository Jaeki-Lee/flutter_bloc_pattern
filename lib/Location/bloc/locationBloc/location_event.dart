part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class SelectLocation extends LocationEvent {
  final Location location;

  const SelectLocation(this.location);

  @override
  List<Object?> get props => [location];
}
