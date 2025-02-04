import 'package:equatable/equatable.dart';
import 'package:hotel_booking/features/home/data/models/hotel_item_dto.dart';

abstract class FavouritesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFavouriteHotelsDataEvent extends FavouritesEvent {}

class FavouriteHotelEvent extends FavouritesEvent {
  final HotelItemDTO hotelItemDTO;
  FavouriteHotelEvent({required this.hotelItemDTO});
}

class UnFavouriteHotelEvent extends FavouritesEvent {
  final HotelItemDTO hotelItemDTO;
  UnFavouriteHotelEvent({required this.hotelItemDTO});
}
