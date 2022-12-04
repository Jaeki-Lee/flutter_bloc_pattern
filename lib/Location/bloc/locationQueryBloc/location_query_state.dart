part of 'location_query_bloc.dart';

abstract class LocationQueryState extends Equatable {
  const LocationQueryState();
}

class LocationQueryInitState extends LocationQueryState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LocationLoading extends LocationQueryState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LocationLoaded extends LocationQueryState {
  final List<Location> locationList;

  const LocationLoaded(this.locationList);

  @override
  List<Object?> get props => [locationList];
}

class LocationLoadError extends LocationQueryState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
