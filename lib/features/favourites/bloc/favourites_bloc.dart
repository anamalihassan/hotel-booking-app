import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/exception/db_connection_exception.dart';
import 'package:hotel_booking/features/favourites/bloc/favourites_event.dart';
import 'package:hotel_booking/features/favourites/bloc/favourites_state.dart';
import 'package:hotel_booking/features/favourites/data/repository/favourites_repository.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final FavouritesRepository _favouritesRepository;

  FavouritesBloc({required FavouritesRepository repository})
      : _favouritesRepository = repository,
        super(FavouritesInitial()) {
    on<FetchFavouriteHotelsDataEvent>(mapFetchFavouriteHotelsDataEventToState);
    on<FavouriteHotelEvent>(mapAddHotelToFavouritesEventToState);
    on<UnFavouriteHotelEvent>(mapRemoveHotelFromFavouritesEventToState);
  }

  Future<void> mapFetchFavouriteHotelsDataEventToState(
    FetchFavouriteHotelsDataEvent event,
    Emitter<FavouritesState> emit,
  ) async {
    emit(FavouriteHotelsDataLoading());
    try {
      final hotels = await _favouritesRepository.fetchFavouriteHotelsData();
      emit(FavouriteHotelsDataSuccess(hotels: hotels));
    } catch (_) {
      emit(FavouriteHotelsFailure(dbConnectionException: DBConnectionException()));
    }
  }

  Future<void> mapAddHotelToFavouritesEventToState(
    FavouriteHotelEvent event,
    Emitter<FavouritesState> emit,
  ) async {
    emit(FavouriteHotelLoading());
    try {
      final hotels = await _favouritesRepository.favouriteHotelItem(event.hotelItemDTO);
      emit(FavouriteHotelsDataSuccess(hotels: hotels));
    } catch (_) {
      emit(FavouriteHotelsFailure(dbConnectionException: DBConnectionException()));
    }
  }

  Future<void> mapRemoveHotelFromFavouritesEventToState(
    UnFavouriteHotelEvent event,
    Emitter<FavouritesState> emit,
  ) async {
    emit(UnFavouriteHotelLoading());
    try {
      final hotels = await _favouritesRepository.unFavouriteHotelItem(event.hotelItemDTO);
      emit(FavouriteHotelsDataSuccess(hotels: hotels));
    } catch (_) {
      emit(FavouriteHotelsFailure(dbConnectionException: DBConnectionException()));
    }
  }
}
