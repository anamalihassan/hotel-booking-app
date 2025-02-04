import 'package:equatable/equatable.dart';
import 'package:hotel_booking/core/exception/db_connection_exception.dart';
import 'package:hotel_booking/features/home/data/models/hotel_item_dto.dart';

abstract class FavouritesState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavouritesInitial extends FavouritesState {}

class FavouriteHotelsDataLoading extends FavouritesState {}

class FavouriteHotelLoading extends FavouritesState {}

class UnFavouriteHotelLoading extends FavouritesState {}

class FavouriteHotelsDataSuccess extends FavouritesState {
  final List<HotelItemDTO> hotels;
  FavouriteHotelsDataSuccess({
    required this.hotels,
  });
}

class FavouriteHotelsFailure extends FavouritesState {
  final DBConnectionException dbConnectionException;

  FavouriteHotelsFailure({
    required this.dbConnectionException,
  });

  @override
  List<Object> get props => [dbConnectionException];
}
