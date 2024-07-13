// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlEntity _$UrlEntityFromJson(Map<String, dynamic> json) => UrlEntity(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String,
      noOfTries: (json['no_of_tries'] as num).toInt(),
      isPeriodic: json['is_periodic'] as String,
    );

Map<String, dynamic> _$UrlEntityToJson(UrlEntity instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'no_of_tries': instance.noOfTries,
      'is_periodic': instance.isPeriodic,
    };
