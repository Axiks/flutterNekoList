import 'package:json_annotation/json_annotation.dart';

//final String tableAlternativeTitleName = 'alternative_anime_name';

part 'alternativeAnimeName.g.dart';

@JsonSerializable()
class AlternativeAnimeName {
  String? id;
  int? animeId;
  int? userId;
  String? lang;
  String? body;
  String? source;
  bool? primary;
  bool? verified;
  DateTime? createdAt;

  AlternativeAnimeName();

  factory AlternativeAnimeName.fromJson(Map<String, dynamic> json) => _$AlternativeAnimeNameFromJson(json);
  Map<String, dynamic> toJson() => _$AlternativeAnimeNameToJson(this);
}