import 'package:restaurant_finder/Core/usecase/usecase.dart';
import 'package:restaurant_finder/Location/models/location.dart';
import 'package:restaurant_finder/Location/repository/location_repository.dart';

class GetLocationUseCase implements UseCase<List<Location>, String> {
  final LocationRepository _locationRepository;

  GetLocationUseCase(this._locationRepository);

  @override
  Future<List<Location>> call(String params) {
    return _locationRepository.submitQuery(params); 
  }
}
