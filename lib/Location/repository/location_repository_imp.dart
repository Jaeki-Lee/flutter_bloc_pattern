import 'package:restaurant_finder/DataLayer/zomato_client.dart';
import 'package:restaurant_finder/Location/models/location.dart';
import 'package:restaurant_finder/Location/repository/location_repository.dart';

class LocationRepositoryImp extends LocationRepository {
  final ZomatoClient _client;

  LocationRepositoryImp(this._client);

  @override
  Future<List<Location>> submitQuery(String query) async {
    List<Location> locationList = await _client.fetchLocations(query);
    return locationList;
    
  }

  
}
