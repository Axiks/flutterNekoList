import 'package:anime_list_app/dao/anime_dao.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/repository/anime_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'anime_event.dart';
import 'anime_states.dart';

class AnimeBlock extends Bloc<AnimeEvent, AnimeState> {
  AnimeBlock(AnimeState initialState) : super(AnimeInitial());
  @override
  Stream<AnimeState> mapEventToState(AnimeEvent event) async* {

    if (event is AnimeGet) {
      yield* _mapAimeGetToState(event);
    } else if (event is AnimeGetAll) {
      yield* _mapAnmeGetAllToState();
    } else if (event is AnimeAdded) {
      yield* _mapAnimeAddedToState(event);
    } else if (event is AnimeDeleted) {
      yield* _mapAnimeDeletedToState(event);
    } else if (event is AnimeSearch) {
      yield* _mapAnimeSearchToState(event);
    }else{
      print("Else");
    }
  }

  Stream<AnimeSuccess> _mapAimeGetToState(AnimeGet event) async* {
    AnimeSuccess state = AnimeSuccess();
    int animeId = event.id;
    //List<Anime> animes = await AnimeDao().getAnime(animeId);
    Anime? anime = await AnimeRepository().animeGet(animeId);

    if(anime == null){
      state = AnimeSuccessFalse();
    }
    else{
      List<Anime> animes = [anime];
      state = AnimeSuccessTrue(anime: animes);
    }
    yield state;
  }

  Stream<AnimeSuccess> _mapAnmeGetAllToState() async* {
    AnimeSuccess state;
    List<Anime>? animes = await AnimeRepository().animeGetAll();
    if(animes != null) {
      state = AnimeSuccessTrue(anime: animes);
    }
    else{
      state = AnimeSuccessFalse();
    }
    yield state;
  }

  Stream<AnimeStatus> _mapAnimeAddedToState(AnimeAdded event) async* {
    Anime anime = event.anime;
    bool progress = await AnimeDao().addAnime(anime);
    AnimeStatus state = AnimeStatus(status: progress);
    yield state;
  }

  Stream<AnimeStatus> _mapAnimeDeletedToState(AnimeDeleted event) async* {
    Anime anime = event.anime;
    bool progress = await AnimeDao().deleteAnime(anime);
    AnimeStatus state = AnimeStatus(status: progress);
    yield state;
  }

  Stream<AnimeSuccess> _mapAnimeSearchToState(AnimeSearch event) async* {
    AnimeSuccess def = AnimeSuccessFalse();
    String name = event.name;
    List<Anime> result = await AnimeRepository().animeSearch(name);
    print("Search state ON");
    print("Search result: " + result.toString());
    def = AnimeSuccessTrue(anime: result);
    yield def;
  }
}