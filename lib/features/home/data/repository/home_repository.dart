import 'package:hotel_booking/features/home/data/models/hotels_response.dart';

abstract class HomeRepository {
  Future<HotelsResponse> fetchHotelsData();
}
