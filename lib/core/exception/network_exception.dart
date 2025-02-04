import 'package:json_annotation/json_annotation.dart';

part 'network_exception.g.dart';

@JsonSerializable()
class NetworkException implements Exception {
  int? timestamp;
  int? statusCode;
  dynamic error;
  String? statusMessage;
  String? path;

  NetworkException({
    this.timestamp,
    this.statusCode,
    this.error,
    this.statusMessage = 'An unknown error has occurred.',
    this.path,
  });

  factory NetworkException.fromJson(Map<String, dynamic> json) => _$NetworkExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkExceptionToJson(this);
}
