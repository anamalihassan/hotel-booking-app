// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_offer_rooms_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestOfferRoomsDTO _$BestOfferRoomsDTOFromJson(Map<String, dynamic> json) =>
    BestOfferRoomsDTO(
      overall: json['overall'] == null
          ? null
          : BestOfferRoomsOverallDTO.fromJson(
              json['overall'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BestOfferRoomsDTOToJson(BestOfferRoomsDTO instance) =>
    <String, dynamic>{
      'overall': instance.overall,
    };
