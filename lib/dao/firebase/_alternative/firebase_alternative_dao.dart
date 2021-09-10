import 'package:anime_list_app/models/connectors/alternative/alternativeTitle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAlternativeDAO{
  late final CollectionReference _collectionReference;
  final String idFieldName;


  FirebaseAlternativeDAO(String tableName, this.idFieldName){
    late final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    this._collectionReference = firebaseFirestore.collection(tableName);
  }

  Future<AlternativeTitle?> addAlternativeName(AlternativeTitle alternativeTitle) async {
    return _collectionReference.add(alternativeTitle.toJson())
        .then((value) {
      print("Added!: " + value.toString());
      var a =  alternativeTitle.copy(
        id: value.id,
      );
      return a;
    })
    // ignore: invalid_return_type_for_catch_error
        .catchError((error) => print("Failed add Alternative title: $error"));
    //throw Exception("Failed add name");
  }

  Future<List<AlternativeTitle>> getAlternativeTitle(int titleId) async {
    return _collectionReference
        .where('animeId', isEqualTo: titleId)
        .get()
        .then((QuerySnapshot querySnapshot) {
          List<AlternativeTitle> alternativeTitleList = [];
          querySnapshot.docs.forEach((queryAlternativeTitle) {
            AlternativeTitle alternativeTitle = AlternativeTitle.fromFirebaseJson(queryAlternativeTitle);
            alternativeTitleList.add(alternativeTitle);
          });
          return alternativeTitleList;
    });
  }

  Future<AlternativeTitle?> updateAlternativeTitle(AlternativeTitle alternativeTitle) async {
    _collectionReference
        .doc(alternativeTitle.id)
        .update(alternativeTitle.toJson())
        .then((value){
          print("Alternative Title Updated");
          return alternativeTitle;
    })
        .catchError((error){
          print("Alternative Title to update user: $error");
    });
  }

   Future<bool> deleteAlternativeTitle(String documentId) async{
      return _collectionReference
          .doc(documentId)
          .delete()
          .then((value){
            print("Alternative Title Deleted");
            return true;
      })
          .catchError((error) {
            print("Failed to delete Alternative Title: $error");
            return false;
      });
  }

}