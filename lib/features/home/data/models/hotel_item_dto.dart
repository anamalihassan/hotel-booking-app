import 'package:hotel_booking/features/home/data/models/rating_info_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'best_offer_dto.dart';
import 'image_item_dto.dart';

part 'hotel_item_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelItemDTO {
  String? name;
  String? destination;
  @JsonKey(name: "hotel-id")
  String? hotelId;
  double? category;
  @JsonKey(name: "rating-info")
  RatingInfoDto? ratingInfo;
  @JsonKey(name: "best-offer")
  BestOfferDTO? bestOffer;
  List<ImageItemDTO>? images;

  HotelItemDTO({
    this.name,
    this.destination,
    this.hotelId,
    this.category,
    this.ratingInfo,
    this.images,
  });

  factory HotelItemDTO.fromJson(Map<String, dynamic> json) => _$HotelItemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$HotelItemDTOToJson(this);
}
