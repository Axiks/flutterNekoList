// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alternativeAnimeDescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlternativeAnimeDescription _$AlternativeAnimeDescriptionFromJson(
    Map<String, dynamic> json) {
  return AlternativeAnimeDescription()
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

Map<String, dynamic> _$AlternativeAnimeDescriptionToJson(
        AlternativeAnimeDescription instance) =>
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
