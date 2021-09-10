import 'package:anime_list_app/models/anime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAnimeProvider{
  final FirebaseFirestore  _firebaseFirestore;

  FirebaseAnimeProvider({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<bool> addAnime(Anime anime) async {
    if(_existenceCheckAnime(anime.malId)){
      return false;
    }
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference animes = _firebaseFirestore.collection('animes');

    animes.add({
      AnimeFiels.malId: anime.malId,
      AnimeFiels.title: anime.title,
      AnimeFiels.mainPicture: anime.mainPicture,
      AnimeFiels.startDate: anime.startDate,
      AnimeFiels.endDate: anime.endDate,
      AnimeFiels.synopsis: anime.synopsis,
      AnimeFiels.createdAt: anime.createdAt,
      AnimeFiels.updatedAt: anime.updatedAt,
      AnimeFiels.mediaType: anime.mediaType,
      AnimeFiels.airing: anime.airing,
      AnimeFiels.episodes: anime.episodes,
    })
        .then((value) => print("Anime Added"))
        .catchError((error) => print("Failed to add anime: $error"));
    return true;
  }

  Future<List<Anime>> getAllAnime() async {
    return _firebaseFirestore
        .collection('animes')
        .get()
        .then((QuerySnapshot querySnapshot) {
          List<Anime> animeList = [];
          querySnapshot.docs.forEach((queryAnime) {
            Anime anime = _querySnapshotToAnime(queryAnime);
            animeList.add(anime);
            print(anime.malId);
          });
          print(animeList.length.toString());
          return animeList;
    });
  }

  Future<Anime?> getAnime(int animeId) async {
    return _firebaseFirestore
        .collection('animes')
        .where('_malId', isEqualTo: animeId)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
          if(querySnapshot.size != 1){
            return null;
          }
          var queryAnime = querySnapshot.docs[0];
          return _querySnapshotToAnime(queryAnime);
    });
    //.catchError((error) => print("Failed get anime: $error"));
    //throw Exception("Failed get anime");
  }

  bool _existenceCheckAnime(int animeId) {
    _firebaseFirestore
        .collection('animes')
        .where('_malId', isEqualTo: animeId)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
          if(querySnapshot.size == 1){
            return true;
          }
    })
        .catchError((error){
          print("_existenceСheckAnime error: ${error.toString()}");
    });
    return false;
  }

  Anime _querySnapshotToAnime(var queryAnime){
    DateTime? startDateTimestamp = queryAnime[AnimeFiels.startDate]?.toDate();
    DateTime? endDateTimestamp = queryAnime[AnimeFiels.endDate]?.toDate();
    Timestamp createdAtTimestamp = queryAnime[AnimeFiels.createdAt];
    Timestamp updatedAtTimestamp = queryAnime[AnimeFiels.updatedAt];

    return Anime(
      malId: queryAnime[AnimeFiels.malId],
      title: queryAnime[AnimeFiels.title],
      mainPicture: queryAnime[AnimeFiels.mainPicture],
      startDate: startDateTimestamp,
      endDate: endDateTimestamp,
      synopsis: queryAnime[AnimeFiels.synopsis],
      createdAt: createdAtTimestamp.toDate(),
      updatedAt: updatedAtTimestamp.toDate(),
      mediaType: queryAnime[AnimeFiels.mediaType],
      airing: queryAnime[AnimeFiels.airing],
      episodes: queryAnime[AnimeFiels.episodes],
    );
  }
}