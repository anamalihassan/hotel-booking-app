import 'package:json_annotation/json_annotation.dart';

part 'rating_info_dto.g.dart';

@JsonSerializable()
class RatingInfoDto {
  @JsonKey(name: "recommendation-rate")
  double? recommendationRate;
  @JsonKey(name: "reviews-count")
  int? reviewsCount;
  double? score;
  @JsonKey(name: "score-description")
  String? scoreDescription;

  RatingInfoDto({
    this.recommendationRate,
    this.reviewsCount,
    this.score,
    this.scoreDescription,
  });

  factory RatingInfoDto.fromJson(Map<String, dynamic> json) => _$RatingInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RatingInfoDtoToJson(this);
}
