enum Genres {
  action,
  adventure,
  cars,
  comedy,
  dementia,
  demons,
  drama,
  ecchi,
  fantasy,
  game,
  harem,
  hentai,
  historical,
  horror,
  josei,
  kids,
  magic,
  martialArts,
  mecha,
  military,
  music,
  mystery,
  parody,
  police,
  psychological,
  romance,
  samurai,
  school,
  sciFi,
  seinen,
  shoujo,
  shoujoAi,
  hounen,
  shounenAi,
  sliceOfLife,
  space,
  sports,
  superPower,
  supernatural,
  thriller,
  vampire,
  yaoi,
  yuri,
  none
}

extension GenreExtension on Genres {

  int get malId{
    switch (this) {
      case Genres.action:
        return 1;
      case Genres.adventure:
        return 2;
      case Genres.cars:
        return 3;
      case Genres.comedy:
        return 4;
      case Genres.dementia:
        return 5;
      case Genres.demons:
        return 6;
      case Genres.drama:
        return 8;
      case Genres.ecchi:
        return 9;
      case Genres.fantasy:
        return 10;
      case Genres.game:
        return 11;
      case Genres.harem:
        return 35;
      case Genres.hentai:
        return 12;
      case Genres.historical:
        return 13;
      case Genres.horror:
        return 14;
      case Genres.josei:
        return 43;
      case Genres.kids:
        return 15;
      case Genres.magic:
        return 16;
      case Genres.martialArts:
        return 17;
      case Genres.mecha:
        return 18;
      case Genres.military:
        return 38;
      case Genres.music:
        return 19;
      case Genres.mystery:
        return 7;
      case Genres.parody:
        return 20;
      case Genres.police:
        return 39;
      case Genres.psychological:
        return 40;
      case Genres.romance:
        return 22;
      case Genres.samurai:
        return 21;
      case Genres.school:
        return 23;
      case Genres.sciFi:
        return 24;
      case Genres.seinen:
        return 43;
      case Genres.shoujo:
        return 25;
      case Genres.shoujoAi:
        return 26;
      case Genres.hounen:
        return 27;
      case Genres.shounenAi:
        return 28;
      case Genres.sliceOfLife:
        return 36;
      case Genres.space:
        return 29;
      case Genres.sports:
        return 30;
      case Genres.superPower:
        return 31;
      case Genres.supernatural:
        return 37;
      case Genres.thriller:
        return 41;
      case Genres.vampire:
        return 32;
      case Genres.yaoi:
        return 33;
      case Genres.yuri:
        return 34;
      case Genres.none:
        return 0;
        default:
          return 0;
      }
  }

  String get nameEng{
    switch (this) {
      case Genres.action:
        return 'Action';
      case Genres.adventure:
        return 'Adventure';
      case Genres.cars:
        return 'Cars';
      case Genres.comedy:
        return 'Comedy';
      case Genres.dementia:
        return 'Dementia';
      case Genres.demons:
        return 'Demons';
      case Genres.drama:
        return 'Drama';
      case Genres.ecchi:
        return 'Ecchi';
      case Genres.fantasy:
        return 'Fantasy';
      case Genres.game:
        return 'Game';
      case Genres.harem:
        return 'Harem';
      case Genres.hentai:
        return 'Hentai';
      case Genres.historical:
        return 'Historical';
      case Genres.horror:
        return 'Horror';
      case Genres.josei:
        return 'Josei';
      case Genres.kids:
        return 'Kids';
      case Genres.magic:
        return 'Magic';
      case Genres.martialArts:
        return 'Martial Arts';
      case Genres.mecha:
        return 'Mecha';
      case Genres.military:
        return 'Military';
      case Genres.music:
        return 'Music';
      case Genres.mystery:
        return 'Mystery';
      case Genres.parody:
        return 'Parody';
      case Genres.police:
        return 'Police';
      case Genres.psychological:
        return 'Psychological';
      case Genres.romance:
        return 'Romance';
      case Genres.samurai:
        return 'Samurai';
      case Genres.school:
        return 'School';
      case Genres.sciFi:
        return 'Sci-Fi';
      case Genres.seinen:
        return 'Seinen';
      case Genres.shoujo:
        return 'Shoujo';
      case Genres.shoujoAi:
        return 'Shoujo Ai';
      case Genres.hounen:
        return 'Shounen';
      case Genres.shounenAi:
        return 'Shounen Ai';
      case Genres.sliceOfLife:
        return 'Slice of Life';
      case Genres.space:
        return 'Space';
      case Genres.sports:
        return 'Sports';
      case Genres.superPower:
        return 'Super Power';
      case Genres.supernatural:
        return 'Supernatural';
      case Genres.thriller:
        return 'Thriller';
      case Genres.vampire:
        return 'Vampire';
      case Genres.yaoi:
        return 'Yaoi';
      case Genres.yuri:
        return 'Yuri';
      case Genres.none:
        return 'None';
      default:
        return 'None';
    }
  }

  String get nameUa{
    switch (this) {
      case Genres.action:
        return '??????';
      case Genres.adventure:
        return '??????????????';
      case Genres.cars:
        return '????????????';
      case Genres.comedy:
        return '??????????????';
      case Genres.dementia:
        return '????????????????';
      case Genres.demons:
        return '????????????';
      case Genres.drama:
        return '??????????';
      case Genres.ecchi:
        return '????????';
      case Genres.fantasy:
        return '????????????????????';
      case Genres.game:
        return '????????';
      case Genres.harem:
        return '??????????';
      case Genres.hentai:
        return '????????????';
      case Genres.historical:
        return '??????????????????';
      case Genres.horror:
        return '????????????';
      case Genres.josei:
        return '????????????';
      case Genres.kids:
        return '????????????';
      case Genres.magic:
        return '??????????';
      case Genres.martialArts:
        return '???????????? ??????????????????';
      case Genres.mecha:
        return '????????';
      case Genres.military:
        return '??????????????????';
      case Genres.music:
        return '????????????';
      case Genres.mystery:
        return '??????????????????????';
      case Genres.parody:
        return '??????????????';
      case Genres.police:
        return '??????????????';
      case Genres.psychological:
        return '????????????????????????';
      case Genres.romance:
        return '??????????????????';
      case Genres.samurai:
        return '??????????????';
      case Genres.school:
        return '??????????';
      case Genres.sciFi:
        return '??????????????-????????????????????????';
      case Genres.seinen:
        return '????????????';
      case Genres.shoujo:
        return '??????????';
      case Genres.shoujoAi:
        return '?????????? ????';
      case Genres.hounen:
        return '??????????';
      case Genres.shounenAi:
        return '?????????? ????';
      case Genres.sliceOfLife:
        return '????????????????????????????';
      case Genres.space:
        return '????????????';
      case Genres.sports:
        return '??????????';
      case Genres.superPower:
        return '??????????????????';
      case Genres.supernatural:
        return '??????????????????????';
      case Genres.thriller:
        return '????????????';
      case Genres.vampire:
        return '????????????';
      case Genres.yaoi:
        return '??????';
      case Genres.yuri:
        return '????????';
      case Genres.none:
        return 'None';
      default:
        return 'None';
    }
  }
}


//class GenresList{
  // List<Genre> genres = [
  //   Genre(
  //       malId: 1,
  //       nameEng: 'Action',
  //       nameUa: '??????'
  //   ),Genre(
  //       malId: 2,
  //       nameEng: 'Adventure',
  //       nameUa: '??????????????'
  //   ),Genre(
  //       malId: 3,
  //       nameEng: 'Cars',
  //       nameUa: '????????????'
  //   ),Genre(
  //       malId: 4,
  //       nameEng: 'Comedy',
  //       nameUa: '??????????????'
  //   ),Genre(
  //       malId: 5,
  //       nameEng: 'Dementia',
  //       nameUa: '????????????????'
  //   ),Genre(
  //       malId: 6,
  //       nameEng: 'Demons',
  //       nameUa: '????????????'
  //   ),Genre(
  //       malId: 8,
  //       nameEng: 'Drama',
  //       nameUa: '??????????'
  //   ),Genre(
  //       malId: 9,
  //       nameEng: 'Ecchi',
  //       nameUa: '????????'
  //   ),Genre(
  //       malId: 10,
  //       nameEng: 'Fantasy',
  //       nameUa: '????????????????????'
  //   ),Genre(
  //       malId: 11,
  //       nameEng: 'Game',
  //       nameUa: '????????'
  //   ),Genre(
  //       malId: 35,
  //       nameEng: 'Harem',
  //       nameUa: '??????????'
  //   ),Genre(
  //       malId: 12,
  //       nameEng: 'Hentai',
  //       nameUa: '????????????'
  //   ),Genre(
  //       malId: 13,
  //       nameEng: 'Historical',
  //       nameUa: '??????????????????'
  //   ),Genre(
  //       malId: 14,
  //       nameEng: 'Horror',
  //       nameUa: '????????????'
  //   ),Genre(
  //       malId: 43,
  //       nameEng: 'Josei',
  //       nameUa: '????????????'
  //   ),Genre(
  //       malId: 15,
  //       nameEng: 'Kids',
  //       nameUa: '????????????'
  //   ),Genre(
  //       malId: 16,
  //       nameEng: 'Magic',
  //       nameUa: '??????????'
  //   ),Genre(
  //       malId: 17,
  //       nameEng: 'Martial Arts',
  //       nameUa: '???????????? ??????????????????'
  //   ),Genre(
  //       malId: 18,
  //       nameEng: 'Mecha',
  //       nameUa: '????????'
  //   ),Genre(
  //       malId: 38,
  //       nameEng: 'Military',
  //       nameUa: '??????????????????'
  //   ),Genre(
  //       malId: 19,
  //       nameEng: 'Music',
  //       nameUa: '????????????'
  //   ),Genre(
  //       malId: 7,
  //       nameEng: 'Mystery',
  //       nameUa: '??????????????????????'
  //   ),Genre(
  //       malId: 20,
  //       nameEng: 'Parody',
  //       nameUa: '??????????????'
  //   ),Genre(
  //       malId: 39,
  //       nameEng: 'Police',
  //       nameUa: '??????????????'
  //   ),Genre(
  //       malId: 40,
  //       nameEng: 'Psychological',
  //       nameUa: '????????????????????????'
  //   ),Genre(
  //       malId: 22,
  //       nameEng: 'Romance',
  //       nameUa: '??????????????????'
  //   ),Genre(
  //       malId: 21,
  //       nameEng: 'Samurai',
  //       nameUa: '??????????????'
  //   ),Genre(
  //       malId: 23,
  //       nameEng: 'School',
  //       nameUa: '??????????'
  //   ),Genre(
  //       malId: 24,
  //       nameEng: 'Sci-Fi',
  //       nameUa: '??????????????-????????????????????????'
  //   ),Genre(
  //       malId: 42,
  //       nameEng: 'Seinen',
  //       nameUa: '????????????'
  //   ),Genre(
  //       malId: 25,
  //       nameEng: 'Shoujo',
  //       nameUa: '??????????'
  //   ),Genre(
  //       malId: 26,
  //       nameEng: 'Shoujo Ai',
  //       nameUa: '?????????? ????'
  //   ),Genre(
  //       malId: 27,
  //       nameEng: 'Shounen',
  //       nameUa: '??????????'
  //   ),Genre(
  //       malId: 28,
  //       nameEng: 'Shounen Ai',
  //       nameUa: '?????????? ????'
  //   ),Genre(
  //       malId: 36,
  //       nameEng: 'Slice of Life',
  //       nameUa: '???????????????? ????????????'
  //   ),Genre(
  //       malId: 29,
  //       nameEng: 'Space',
  //       nameUa: '????????????'
  //   ),Genre(
  //       malId: 30,
  //       nameEng: 'Sports',
  //       nameUa: '??????????'
  //   ),Genre(
  //       malId: 31,
  //       nameEng: 'Super Power',
  //       nameUa: '?????????? ????????'
  //   ),Genre(
  //       malId: 37,
  //       nameEng: 'Supernatural',
  //       nameUa: '??????????????????????'
  //   ),Genre(
  //       malId: 41,
  //       nameEng: 'Thriller',
  //       nameUa: '????????????'
  //   ),Genre(
  //       malId: 32,
  //       nameEng: 'Vampire',
  //       nameUa: '????????????'
  //   ),Genre(
  //       malId: 33,
  //       nameEng: 'Yaoi',
  //       nameUa: '??????'
  //   ),Genre(
  //       malId: 34,
  //       nameEng: 'Yuri',
  //       nameUa: '????????'
  //   ),
  //
  // ];
//}