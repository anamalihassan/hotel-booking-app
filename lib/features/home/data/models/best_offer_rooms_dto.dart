import 'package:json_annotation/json_annotation.dart';

import 'best_offer_rooms_overall_dto.dart';

part 'best_offer_rooms_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BestOfferRoomsDTO {
  BestOfferRoomsOverallDTO? overall;

  BestOfferRoomsDTO({
    this.overall,
  });

  factory BestOfferRoomsDTO.fromJson(Map<String, dynamic> json) => _$BestOfferRoomsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BestOfferRoomsDTOToJson(this);
}
