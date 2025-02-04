import 'package:json_annotation/json_annotation.dart';

part 'image_item_dto.g.dart';

@JsonSerializable()
class ImageItemDTO {
  String? large;
  String? small;

  ImageItemDTO({
    this.large,
    this.small,
  });

  factory ImageItemDTO.fromJson(Map<String, dynamic> json) => _$ImageItemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ImageItemDTOToJson(this);
}
