import 'package:anime_list_app/models/connectors/alternative/alternativeAnimeName.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeTitle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final String tableAlternativeTitleName = 'alternative_anime_name';

class FirebaseAlternativeAnimeNameProvider{
  final _alternativeTitleNameRef;

  FirebaseAlternativeAnimeNameProvider()
      : _alternativeTitleNameRef =  FirebaseFirestore.instance.collection(tableAlternativeTitleName).withConverter<AlternativeAnimeName>(
    fromFirestore: (snapshot, _) => AlternativeAnimeName.fromJson(snapshot.data()!),
    toFirestore: (alternativeTitleName, _) => alternativeTitleName.toJson(),
  );

  Future<AlternativeAnimeName?> addAlternativeAnimeName(AlternativeAnimeName alternativeAnimeName) async {
    // 1. Перевіряємо чи таке ім'я існує
    await _alternativeTitleNameRef
        .where('animeId', isEqualTo: alternativeAnimeName.animeId)
        .where('lang', isEqualTo: alternativeAnimeName.lang)
        .where('lang', isEqualTo: alternativeAnimeName.lang)
        .where('body', isEqualTo: alternativeAnimeName.body)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
          if(querySnapshot.size == 1){
            throw("Such a name exists");
          }
        }).catchError((error){
          print(error.toString());
          throw(error);
        });

    // 2. Якщо НІ, то добавляємо в БД
    QueryDocumentSnapshot<AlternativeAnimeName> alternativeNameSnapshot = await _alternativeTitleNameRef.add(alternativeAnimeName)
        .then((value) => print("Anime Added"))
        .catchError((error) {
          print("Failed to add alternative name: $error");
          throw(error);
    });

    AlternativeAnimeName alternativeAnimeNameFromDB = alternativeNameSnapshot.data();
    alternativeAnimeNameFromDB.id = alternativeNameSnapshot.id;
    return alternativeAnimeNameFromDB;
  }

  Future<List<AlternativeAnimeName>> getAlternativeAnimeName(int animeId) async {
    List<AlternativeAnimeName> alternativeTitleList = [];

    List<QueryDocumentSnapshot<AlternativeAnimeName>> alternativeNames = await _alternativeTitleNameRef
        .where('animeId', isEqualTo: animeId)
        .get()
        .then((snapshot) => snapshot.docs);

    alternativeNames.forEach((element) {
      alternativeTitleList.add(element.data());
    });
    return alternativeTitleList;
  }

  Future<AlternativeAnimeName> updateAlternative(AlternativeTitle alternativeTitle) async {
    QueryDocumentSnapshot<AlternativeAnimeName> alternativeNameSnapshot = await _alternativeTitleNameRef.doc(alternativeTitle.id)
        .update(alternativeTitle.toJson())
        .then((value) => print("User Updated"))
        .catchError((error) {
          print("Failed to update alternative name: $error");
          throw(error);
        });
    return alternativeNameSnapshot.data();
  }

  Future<bool> deleteAlternative(String documentId) async{
    _alternativeTitleNameRef
        .doc(documentId)
        .delete()
        .then((value) {
          return true;
        })
        .catchError((error){
          print("Failed to delete user: $error");
          throw(error);
        });
    return false;
  }
}