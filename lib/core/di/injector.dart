import 'package:get_it/get_it.dart';
import 'package:hotel_booking/features/favourites/bloc/favourites_bloc.dart';
import 'package:hotel_booking/features/favourites/data/repository/favourites_repository_impl.dart';
import 'package:hotel_booking/features/home/bloc/home_bloc.dart';
import 'package:hotel_booking/features/home/data/repository/home_repository.dart';
import 'package:hotel_booking/features/home/data/repository/home_repository_impl.dart';

import '../../features/favourites/data/repository/favourites_repository.dart';

final injector = GetIt.instance;

Future<void> initDependencies() async {
  injector.registerLazySingleton<FavouritesRepository>(() => FavouritesRepositoryImpl());
  injector.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());

  injector.registerFactory(() => HomeBloc(repository: injector()));
  injector.registerFactory(() => FavouritesBloc(repository: injector()));

  await injector<FavouritesRepository>().initDb();
}
