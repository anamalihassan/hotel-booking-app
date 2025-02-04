// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingInfoDto _$RatingInfoDtoFromJson(Map<String, dynamic> json) =>
    RatingInfoDto(
      recommendationRate: (json['recommendation-rate'] as num?)?.toDouble(),
      reviewsCount: (json['reviews-count'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toDouble(),
      scoreDescription: json['score-description'] as String?,
    );

Map<String, dynamic> _$RatingInfoDtoToJson(RatingInfoDto instance) =>
    <String, dynamic>{
      'recommendation-rate': instance.recommendationRate,
      'reviews-count': instance.reviewsCount,
      'score': instance.score,
      'score-description': instance.scoreDescription,
    };
