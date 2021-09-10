import 'package:anime_list_app/block/anime/anime_block.dart';
import 'package:anime_list_app/block/anime/anime_event.dart';
import 'package:anime_list_app/block/anime/anime_states.dart';
import 'package:anime_list_app/screens/anime_list_widget.dart';
import 'package:anime_list_app/screens/anime_draggable_page_screen.dart';
import 'package:anime_list_app/screens/anime_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/anime.dart';
import '../models/data.dart';

class BrowseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Neko List App ;3"),
        centerTitle: true,
        backgroundColor: Colors.black87, // status bar color
        brightness: Brightness.light, // status
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
        body: BlocProvider<AnimeBlock>(
          create: (BuildContext context) => AnimeBlock(AnimeInitial()),
            child: BlocBuilder<AnimeBlock, AnimeState>(
                builder: (context, state) {
                  AnimeGetAll animeAll = AnimeGetAll();
                  context.read<AnimeBlock>().add(animeAll);
                  if(state is AnimeInitial){
                    return Center(
                        child: Text("Initinal...")
                    );
                  }else if(state is AnimeSuccessFalse){
                    return Text("Помилка отримання даних");
                  }else if(state is AnimeSuccessTrue){
                    AnimeSuccessTrue as = state;
                    List<Anime> animes = as.anime;
                    return AnimesListWidget(animes);
                  }else{
                    return Center(
                        child: Text("Какая то лєва подія: " + state.toString())
                    );
                  }
                }
            )
        )
    );
  }
}