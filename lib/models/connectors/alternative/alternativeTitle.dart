import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AlternativeTitleFields{
  static final String id = "_id";
  static final String titleId = "title_id";
  static final String userId = "user_id";
  static final String lang = "lang";
  static final String body = "body";
  static final String source = "source";
  static final String primary = "primary";
  static final String verified = "verified";
  static final String createdAt = "created_at";

  // AlternativeTitleFields(String titleIdFieldsName){
  //   this.titleId = titleIdFieldsName;
  // }

}

class AlternativeTitle extends Equatable{
  final String? id;
  final int titleId;
  final int? userId;
  final String lang;
  final String body;
  final String? source;
  final bool primary;
  final bool verified;
  final DateTime? createdAt;

  const AlternativeTitle({
    this.id,
    required this.titleId,
    this.userId,
    required this.lang,
    required this.body,
    this.source,
    required this.primary,
    required this.verified,
    this.createdAt,
  });

  List<Object?> get props => [
    id,
    titleId,
    userId,
    lang,
    body,
    source,
    primary,
    verified,
    createdAt,
  ];

  Map<String, Object> toJson() => {
    AlternativeTitleFields.id: id ?? "",
    AlternativeTitleFields.titleId: titleId,
    AlternativeTitleFields.userId: userId ?? "",
    AlternativeTitleFields.lang: lang,
    AlternativeTitleFields.body: body,
    AlternativeTitleFields.source: source ?? "",
    AlternativeTitleFields.primary: primary,
    AlternativeTitleFields.verified: verified,
    AlternativeTitleFields.createdAt: createdAt ?? "",
  };

  factory AlternativeTitle.fromDatabaseJson(Map<String, dynamic> data) => AlternativeTitle(
    id: data[AlternativeTitleFields.id],
    titleId: data[AlternativeTitleFields.titleId],
    userId: int.tryParse(data[AlternativeTitleFields.userId]) ?? 0,
    lang: data[AlternativeTitleFields.lang],
    body: data[AlternativeTitleFields.body],
    source: data[AlternativeTitleFields.source],
    primary: data[AlternativeTitleFields.primary],
    verified: data[AlternativeTitleFields.verified],
    createdAt: DateTime.parse(data[AlternativeTitleFields.createdAt]),
  );

  factory AlternativeTitle.fromFirebaseJson(QueryDocumentSnapshot<Object?> data) => AlternativeTitle(
    id: data[AlternativeTitleFields.id],
    titleId: data[AlternativeTitleFields.titleId],
    userId: int.tryParse(data[AlternativeTitleFields.userId]) ?? 0,
    lang: data[AlternativeTitleFields.lang],
    body: data[AlternativeTitleFields.body],
    source: data[AlternativeTitleFields.source],
    primary: data[AlternativeTitleFields.primary],
    verified: data[AlternativeTitleFields.verified],
    createdAt: DateTime.parse(data[AlternativeTitleFields.createdAt]),
  );

  AlternativeTitle copy({
    String? id,
    int? titleId,
    int? userId,
    String? lang,
    String? body,
    String? source,
    bool? primary,
    bool? verified,
    DateTime? createdAt
  }) => AlternativeTitle(
    id: id ?? this.id,
    titleId: titleId ?? this.titleId,
    userId: userId ?? this.userId,
    lang: lang ?? this.lang,
    body: body ?? this.body,
    source: source ?? this.source,
    verified: verified ?? this.verified,
    primary: primary ?? this.primary,
    createdAt: createdAt ?? this.createdAt,
  );

}