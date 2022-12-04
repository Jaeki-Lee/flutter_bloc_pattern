import 'package:get_it/get_it.dart';
import 'package:restaurant_finder/DataLayer/zomato_client.dart';
import 'package:restaurant_finder/Location/repository/location_repository.dart';
import 'package:restaurant_finder/Location/repository/location_repository_imp.dart';
import 'package:restaurant_finder/Location/usecase/get_location_usecase.dart';

import 'Location/bloc/locationQueryBloc/location_query_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //api class
  injector.registerSingleton<ZomatoClient>(ZomatoClient());

  injector
      .registerSingleton<LocationRepository>(LocationRepositoryImp(injector()));

  injector
      .registerSingleton<GetLocationUseCase>(GetLocationUseCase(injector()));

  injector
      .registerFactory<LocationQueryBloc>(() => LocationQueryBloc(injector()));
}
