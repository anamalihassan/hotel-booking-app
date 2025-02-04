import 'package:hotel_booking/features/home/data/models/travel_date_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'best_offer_rooms_dto.dart';

part 'best_offer_dto.g.dart';

@JsonSerializable()
class BestOfferDTO {
  @JsonKey(name: "included-travel-discount")
  int? includedTravelDiscount;
  @JsonKey(name: "original-travel-price")
  int? originalTravelPrice;
  @JsonKey(name: "simple-price-per-person")
  int? simplePricePerPerson;
  int? total;
  @JsonKey(name: "travel-price")
  int? travelPrice;
  BestOfferRoomsDTO? rooms;
  @JsonKey(name: "travel-date")
  TravelDateDTO? travelDate;

  BestOfferDTO({
    this.includedTravelDiscount,
    this.originalTravelPrice,
    this.simplePricePerPerson,
    this.total,
    this.travelPrice,
    this.rooms,
  });

  factory BestOfferDTO.fromJson(Map<String, dynamic> json) => _$BestOfferDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BestOfferDTOToJson(this);
}
