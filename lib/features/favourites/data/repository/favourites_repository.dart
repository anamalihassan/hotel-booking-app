import 'package:hotel_booking/features/home/data/models/hotel_item_dto.dart';

abstract class FavouritesRepository {
  Future<bool> initDb();
  Future<List<HotelItemDTO>> fetchFavouriteHotelsData();
  Future<List<HotelItemDTO>> favouriteHotelItem(HotelItemDTO hotelItem);
  Future<List<HotelItemDTO>> unFavouriteHotelItem(HotelItemDTO hotelItem);
  Future<void> unFavouriteAllHotelItems();
}
