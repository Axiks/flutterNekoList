import 'package:anime_list_app/dao/anime_dao.dart';
import 'package:anime_list_app/dataprovider/firebase_anime_provider.dart';
import 'package:anime_list_app/dataprovider/my_anime_list_rep.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeTitleDescription.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeAnimeName.dart';
import 'package:anime_list_app/repository/alternative_repository.dart';

class AnimeRepository{
  Future<List<Anime>> animeSearch(String q) async {
    List<Anime> animes = await MyAnimeListRep().animeSearch(q);
    //AddToLocalDB
    // for(int i=0; i<animes.length; i++){
    //   if(await _checkAnimeLocalDB(animes[i].malId) == false){
    //     print("Add to DB Anime id: " + animes[i].malId.toString());
    //     bool res = await _addAnimeLocalDB(animes[i]);
    //     //print(res.toString());
    //   }
    // }
    //animeGet(animes[0].malId);
    return animes;
  }

  Future<List<Anime>> animeGetAll() async {
    //List<Anime> animes = await AnimeDao().getAllAnime();
    List<Anime> animes = await FirebaseAnimeProvider().getAllAnime();

    // animes!.forEach((anime) {
    //
    // });

    // for(int i = 0; i < animes.length; i++){
    //   List<AlternativeName> alternativeTitles = [];
    //   alternativeTitles.addAll(animes[i].alternativeTitles);
    //   List<AlternativeName> alternativeTitlesBD = await AlternativeRepository().alternativeNameGet(animes[i].malId);
    //   alternativeTitles.addAll(alternativeTitlesBD);
    //
    //   List<AlternativeDescription> alternativeSynopsis = [];
    //   alternativeSynopsis.addAll(animes[i].alternativeSynopsis);
    //   List<AlternativeDescription> alternativeSynopsisDB = await AlternativeRepository().alternativeDescriptionGet(animes[i].malId);
    //   alternativeSynopsis.addAll(alternativeSynopsisDB);
    //
    //   animes[i] = animes[i].copy(
    //       alternativeTitles: alternativeTitles,
    //       alternativeSynopsis: alternativeSynopsis
    //   );
    // }

    return animes;
  }

  Future<Anime?> animeGet(int id) async {
    Anime? animes;
    //Check in DB
    animes = await FirebaseAnimeProvider().getAnime(id);
    if(animes == null){
      //Upload anime to DB
      print("Add to DB Anime id: " + id.toString());
      animes = await MyAnimeListRep().animeGet(id);
      //await _addAnimeLocalDB(animes);
      _addAnimeFirebaseDB(animes);
    }

    // if(await _checkAnimeLocalDB(id) == false){
    //   print("Add to DB Anime id: " + id.toString());
    //   bool res = await _addAnimeLocalDB(animes);
    //   _addAnimeFirebaseDB(animes);
    //   //print(res.toString());
    // }

    // List<AlternativeName> alternativeTitles = [];
    // alternativeTitles.addAll(animes.alternativeTitles);
    // List<AlternativeName> alternativeTitlesBD = await AlternativeRepository().alternativeNameGet(id);
    // alternativeTitles.addAll(alternativeTitlesBD);
    //
    // List<AlternativeDescription> alternativeSynopsis = [];
    // alternativeSynopsis.addAll(animes.alternativeSynopsis);
    // List<AlternativeDescription> alternativeSynopsisDB = await AlternativeRepository().alternativeDescriptionGet(id);
    // alternativeSynopsis.addAll(alternativeSynopsisDB);
    //
    // animes = animes.copy(
    //     alternativeTitles: alternativeTitles,
    //     alternativeSynopsis: alternativeSynopsis
    // );
    return animes;

  }

  Future<bool> _checkAnimeLocalDB(int animeId) async {
    bool check = false;
    List<Anime> anime = await AnimeDao().getAnime(animeId);
    if(anime.length != 0){
      check = true;
    }
    return check;
  }

  Future<bool> _addAnimeLocalDB(Anime anime) async {
    bool check = false;
    check = await AnimeDao().addAnime(anime);
    if(anime.alternativeTitles.isNotEmpty){
      //check = await AlternativeDao().addAlternative(anime.alternativeTitles.first);
    }
    if(anime.alternativeSynopsis.isNotEmpty){
      //check = await AlternativeDao().addAlternative(anime.alternativeSynopsis.first);
    }
    return check;
  }

  Future<void> _addAnimeFirebaseDB(Anime anime) async {
    FirebaseAnimeProvider firebaseAnimeProvider = FirebaseAnimeProvider();
    firebaseAnimeProvider.addAnime(anime);
  }
}