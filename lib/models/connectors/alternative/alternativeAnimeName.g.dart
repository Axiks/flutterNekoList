// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alternativeAnimeName.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlternativeAnimeName _$AlternativeAnimeNameFromJson(Map<String, dynamic> json) {
  return AlternativeAnimeName()
    ..id = json['id'] as String?
    ..animeId = json['animeId'] as int?
    ..userId = json['userId'] as int?
    ..lang = json['lang'] as String?
    ..body = json['body'] as String?
    ..source = json['source'] as String?
    ..primary = json['primary'] as bool?
    ..verified = json['verified'] as bool?
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String);
}

Map<String, dynamic> _$AlternativeAnimeNameToJson(
        AlternativeAnimeName instance) =>
    <String, dynamic>{
      'id': instance.id,
      'animeId': instance.animeId,
      'userId': instance.userId,
      'lang': instance.lang,
      'body': instance.body,
      'source': instance.source,
      'primary': instance.primary,
      'verified': instance.verified,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
