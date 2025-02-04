// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_offer_rooms_overall_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestOfferRoomsOverallDTO _$BestOfferRoomsOverallDTOFromJson(
        Map<String, dynamic> json) =>
    BestOfferRoomsOverallDTO(
      boarding: json['boarding'] as String?,
      name: json['name'] as String?,
      adultCount: (json['adult-count'] as num?)?.toInt(),
      childrenCount: (json['children-count'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BestOfferRoomsOverallDTOToJson(
        BestOfferRoomsOverallDTO instance) =>
    <String, dynamic>{
      'boarding': instance.boarding,
      'name': instance.name,
      'adult-count': instance.adultCount,
      'children-count': instance.childrenCount,
      'quantity': instance.quantity,
    };
