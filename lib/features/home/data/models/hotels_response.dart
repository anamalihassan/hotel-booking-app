import 'package:hotel_booking/features/home/data/models/used_search_request_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'hotel_item_dto.dart';

part 'hotels_response.g.dart';

@JsonSerializable()
class HotelsResponse {
  @JsonKey(name: "hotel-count")
  int? hotelCount;
  List<HotelItemDTO>? hotels;
  @JsonKey(name: "used-search-request")
  UsedSearchRequestDTO? usedSearchRequest;
  HotelsResponse({
    this.hotels,
  });

  factory HotelsResponse.fromJson(Map<String, dynamic> json) => _$HotelsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HotelsResponseToJson(this);
}
