// import 'package:anime_list_app/models/connectors/alternative/alternativeTitle.dart';
// import 'package:equatable/equatable.dart';
//
// final String tableAlternativeTitleDescription = 'alternative_title_description';
//
// class AlternativeDescription extends AlternativeTitle{
//   AlternativeDescription({
//     String? id,
//     required int animeId,
//     int? userId,
//     required String lang,
//     required String body,
//     String? source,
//     required bool primary,
//     required bool verified,
//     required DateTime createdAt
//   }): super(
//     id: id,
//     animeId: animeId,
//     userId: userId,
//     lang: lang,
//     body: body,
//     source: source,
//     primary: primary,
//     verified: verified,
//     createdAt: createdAt,
//   );
//
//   factory AlternativeDescription.fromDatabaseJson(Map<String, dynamic> data) => AlternativeDescription(
//     id: data[AlternativeTitleFiels.id],
//     animeId: data[AlternativeTitleFiels.animeId],
//     userId: int.tryParse(data[AlternativeTitleFiels.userId]) ?? 0,
//     lang: data[AlternativeTitleFiels.lang],
//     body: data[AlternativeTitleFiels.body],
//     source: data[AlternativeTitleFiels.source],
//     primary: data[AlternativeTitleFiels.primary],
//     verified: data[AlternativeTitleFiels.verified],
//     createdAt: DateTime.parse(data[AlternativeTitleFiels.createdAt]),
//   );
// }