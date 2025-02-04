import 'package:json_annotation/json_annotation.dart';

part 'used_search_request_dto.g.dart';

@JsonSerializable()
class UsedSearchRequestDTO {
  String? destination;

  UsedSearchRequestDTO({
    this.destination,
  });

  factory UsedSearchRequestDTO.fromJson(Map<String, dynamic> json) => _$UsedSearchRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UsedSearchRequestDTOToJson(this);
}
