import 'package:anime_list_app/block/anime/anime_block.dart';
import 'package:anime_list_app/block/anime/anime_event.dart';
import 'package:anime_list_app/block/anime/anime_states.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/repository/anime_repository.dart';
import 'package:anime_list_app/screens/anime_list_widget.dart';
import 'package:anime_list_app/screens/anime_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //List<Anime> animes = AnimeRepository().animeSearch("Toradora");
    // TODO: implement build
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => AnimeBlock(AnimeInitial()),
        child: Container(
          //child: CountAnimesWidget(),
          child: AnimeSearchScreen(),
        ),
      ),
    );
  }
}