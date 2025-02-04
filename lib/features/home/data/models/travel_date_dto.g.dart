// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_date_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelDateDTO _$TravelDateDTOFromJson(Map<String, dynamic> json) =>
    TravelDateDTO(
      days: (json['days'] as num?)?.toInt(),
      nights: (json['nights'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TravelDateDTOToJson(TravelDateDTO instance) =>
    <String, dynamic>{
      'days': instance.days,
      'nights': instance.nights,
    };
