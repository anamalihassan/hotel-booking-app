// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkException _$NetworkExceptionFromJson(Map<String, dynamic> json) =>
    NetworkException(
      timestamp: (json['timestamp'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      error: json['error'],
      statusMessage:
          json['statusMessage'] as String? ?? 'An unknown error has occurred.',
      path: json['path'] as String?,
    );

Map<String, dynamic> _$NetworkExceptionToJson(NetworkException instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'statusCode': instance.statusCode,
      'error': instance.error,
      'statusMessage': instance.statusMessage,
      'path': instance.path,
    };
