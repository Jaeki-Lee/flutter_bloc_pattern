import 'package:restaurant_finder/Location/models/location.dart';

abstract class LocationRepository {
  Future<List<Location>> submitQuery(String query);
}