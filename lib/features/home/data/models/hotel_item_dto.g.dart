// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelItemDTO _$HotelItemDTOFromJson(Map<String, dynamic> json) => HotelItemDTO(
      name: json['name'] as String?,
      destination: json['destination'] as String?,
      hotelId: json['hotel-id'] as String?,
      category: (json['category'] as num?)?.toDouble(),
      ratingInfo: json['rating-info'] == null
          ? null
          : RatingInfoDto.fromJson(json['rating-info'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..bestOffer = json['best-offer'] == null
        ? null
        : BestOfferDTO.fromJson(json['best-offer'] as Map<String, dynamic>);

Map<String, dynamic> _$HotelItemDTOToJson(HotelItemDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'destination': instance.destination,
      'hotel-id': instance.hotelId,
      'category': instance.category,
      'rating-info': instance.ratingInfo?.toJson(),
      'best-offer': instance.bestOffer?.toJson(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
    };
