// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestOfferDTO _$BestOfferDTOFromJson(Map<String, dynamic> json) => BestOfferDTO(
      includedTravelDiscount:
          (json['included-travel-discount'] as num?)?.toInt(),
      originalTravelPrice: (json['original-travel-price'] as num?)?.toInt(),
      simplePricePerPerson: (json['simple-price-per-person'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      travelPrice: (json['travel-price'] as num?)?.toInt(),
      rooms: json['rooms'] == null
          ? null
          : BestOfferRoomsDTO.fromJson(json['rooms'] as Map<String, dynamic>),
    )..travelDate = json['travel-date'] == null
        ? null
        : TravelDateDTO.fromJson(json['travel-date'] as Map<String, dynamic>);

Map<String, dynamic> _$BestOfferDTOToJson(BestOfferDTO instance) =>
    <String, dynamic>{
      'included-travel-discount': instance.includedTravelDiscount,
      'original-travel-price': instance.originalTravelPrice,
      'simple-price-per-person': instance.simplePricePerPerson,
      'total': instance.total,
      'travel-price': instance.travelPrice,
      'rooms': instance.rooms,
      'travel-date': instance.travelDate,
    };
