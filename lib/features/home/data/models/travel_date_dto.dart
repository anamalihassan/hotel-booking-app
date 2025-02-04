import 'package:json_annotation/json_annotation.dart';

part 'travel_date_dto.g.dart';

@JsonSerializable()
class TravelDateDTO {
  int? days;
  int? nights;

  TravelDateDTO({
    this.days,
    this.nights,
  });

  factory TravelDateDTO.fromJson(Map<String, dynamic> json) => _$TravelDateDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TravelDateDTOToJson(this);
}
