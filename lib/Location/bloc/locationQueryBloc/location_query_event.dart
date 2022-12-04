part of 'location_query_bloc.dart';

abstract class LocationQueryEvent extends Equatable {
  const LocationQueryEvent();
}

class SubmitQueryEvent extends LocationQueryEvent {
  final String query;

  const SubmitQueryEvent(this.query);

  @override
  List<Object?> get props => throw UnimplementedError();
}
