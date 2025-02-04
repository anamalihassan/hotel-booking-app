// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotels_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelsResponse _$HotelsResponseFromJson(Map<String, dynamic> json) =>
    HotelsResponse(
      hotels: (json['hotels'] as List<dynamic>?)
          ?.map((e) => HotelItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..hotelCount = (json['hotel-count'] as num?)?.toInt()
      ..usedSearchRequest = json['used-search-request'] == null
          ? null
          : UsedSearchRequestDTO.fromJson(
              json['used-search-request'] as Map<String, dynamic>);

Map<String, dynamic> _$HotelsResponseToJson(HotelsResponse instance) =>
    <String, dynamic>{
      'hotel-count': instance.hotelCount,
      'hotels': instance.hotels,
      'used-search-request': instance.usedSearchRequest,
    };
