import 'package:anime_list_app/models/connectors/alternative/alternativeTitle.dart';

// final String tableAlternativeTitleName = 'alternative_title_name';
// final String titleIdFieldsName = 'animeId';

import 'package:json_annotation/json_annotation.dart';

part 'alternativeAnimeDescription.g.dart';

@JsonSerializable()
class AlternativeAnimeDescription {
  String? id;
  int? animeId;
  int? userId;
  String? lang;
  String? body;
  String? source;
  bool? primary;
  bool? verified;
  DateTime? createdAt;

  AlternativeAnimeDescription();

  factory AlternativeAnimeDescription.fromJson(Map<String, dynamic> json) => _$AlternativeAnimeDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$AlternativeAnimeDescriptionToJson(this);
}


// class AlternativeAnimeName extends AlternativeTitle{
//   AlternativeAnimeName({
//     String? id,
//     required int animeId,
//     int? userId,
//     required String lang,
//     required String body,
//     String? source,
//     required bool primary,
//     required bool verified,
//     DateTime? createdAt
// }): super(
//     id: id,
//     titleId: animeId,
//     userId: userId,
//     lang: lang,
//     body: body,
//     source: source,
//     primary: primary,
//     verified: verified,
//     createdAt: createdAt,
//   );
//
//   // factory AlternativeAnimeName.fromDatabaseJson(Map<String, dynamic> data) => AlternativeName(
//   //   id: data[AlternativeAnimeFields...],
//   //   animeIad: data[AlternativeTitleFiels.animeId],
//   //   userId: int.tryParse(data[AlternativeTitleFiels.userId]) ?? 0,
//   //   lang: data[AlternativeTitleFiels.lang],
//   //   body: data[AlternativeTitleFiels.body],
//   //   source: data[AlternativeTitleFiels.source],
//   //   primary: data[AlternativeTitleFiels.primary],
//   //   verified: data[AlternativeTitleFiels.verified],
//   //   createdAt: DateTime.parse(data[AlternativeTitleFiels.createdAt]),
//   // );
//
// }