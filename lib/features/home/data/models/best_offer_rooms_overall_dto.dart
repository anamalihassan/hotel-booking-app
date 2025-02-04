import 'package:json_annotation/json_annotation.dart';

part 'best_offer_rooms_overall_dto.g.dart';

@JsonSerializable()
class BestOfferRoomsOverallDTO {
  String? boarding;
  String? name;
  @JsonKey(name: "adult-count")
  int? adultCount;
  @JsonKey(name: "children-count")
  int? childrenCount;
  int? quantity;

  BestOfferRoomsOverallDTO({
    this.boarding,
    this.name,
    this.adultCount,
    this.childrenCount,
    this.quantity,
  });

  factory BestOfferRoomsOverallDTO.fromJson(Map<String, dynamic> json) => _$BestOfferRoomsOverallDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BestOfferRoomsOverallDTOToJson(this);
}
