import 'package:anime_list_app/dataprovider/firebase_alternative_anime_name_provider.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeAnimeDescription.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeAnimeName.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeTitle.dart';

class AlternativeRepository{

  Future<List<AlternativeAnimeName>> alternativeNameGet(int animeId) async {
    FirebaseAlternativeAnimeNameProvider firebaseAlternativeAnimeNameProvider = FirebaseAlternativeAnimeNameProvider();
    List<AlternativeAnimeName> alternativeName = await firebaseAlternativeAnimeNameProvider.getAlternativeAnimeName(animeId);
    return alternativeName;
  }

  // Future<List<AlternativeAnimeDescription>> alternativeDescriptionGet(int animeId) async {
  //   List<AlternativeAnimeDescription> alternativeDescription = await AlternativeDao().getAlternativeDescription(animeId);
  //   return alternativeDescription;
  // }

  Future<AlternativeAnimeName?> alternativeNameAdd(AlternativeAnimeName alternativeAnimeName) async {
    FirebaseAlternativeAnimeNameProvider firebaseAlternativeAnimeNameProvider = FirebaseAlternativeAnimeNameProvider();
    return await firebaseAlternativeAnimeNameProvider.addAlternativeAnimeName(alternativeAnimeName);
  }

  // Future<bool> alternativeDelete(AlternativeTitle altTitleItem) async {
  //   bool success = false;
  //   success = await AlternativeDao().deleteAlternative(altTitleItem);
  //   return success;
  // }

  // Future<bool> addAnimeName(int animeId, AlternativeName alternativeName) async {
  //   FirebaseAlternativeDAO firebaseAlternativeDAO = FirebaseAlternativeDAO(tableName: "anime_names");
  //   firebaseAlternativeDAO.addAlternativeName();
  //
  //   //success = await AlternativeDao().addAlternative(altTitleItem);
  //   //return await FirebaseAlternativeProvider().addAlternativeName(altTitleItem) != null ? true : false;
  // }

}

//add
//update
//delete
//select
//selectAll
//verefited
//unverefited
//setDeafult
//unsetDeafult
//find