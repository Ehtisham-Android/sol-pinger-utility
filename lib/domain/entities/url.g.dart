// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlEntity _$UrlEntityFromJson(Map<String, dynamic> json) => UrlEntity(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String,
      noOfTries: (json['no_of_tries'] as num).toInt(),
      isHalt: (json['is_halt'] as num).toInt(),
      severity: json['severity'] as String,
      lastChecked: json['last_checked'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      totalFailures: (json['total_failures'] as num).toInt(),
      hitsSince: (json['hits_since'] as num).toInt(),
    );

Map<String, dynamic> _$UrlEntityToJson(UrlEntity instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'no_of_tries': instance.noOfTries,
      'is_halt': instance.isHalt,
      'severity': instance.severity,
      'last_checked': instance.lastChecked,
      'status': instance.status,
      'created_at': instance.createdAt,
      'total_failures': instance.totalFailures,
      'hits_since': instance.hitsSince,
    };
