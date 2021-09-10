import 'package:anime_list_app/models/connectors/alternative/alternativeAnimeName.dart';
import 'package:anime_list_app/repository/alternative_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'alternative_event.dart';
import 'alternative_states.dart';

class AlternativeBlock extends Bloc<AlternativeEvent, AlternativeState> {
  AlternativeBlock(AlternativeState initialState) : super(AlternativeInitial());
  @override
  Stream<AlternativeState> mapEventToState(AlternativeEvent event) async* {

    if (event is AlternativeAddAnimeName) {
      yield* _mapAlternativeAdd(event);
    }
    // else if (event is AlternativeGetDescription) {
    //   yield* _mapAlternativeGetDescription(event);
    // }
    else if (event is AlternativeGetName) {
      yield* _mapAlternativeGetName(event);
    }
    // else if (event is AlternativeDelete) {
    //   yield* _mapAlternativeDelete(event);
    // }
  }

  Stream<AlternativeAdded> _mapAlternativeAdd(AlternativeAddAnimeName event) async* {
    await AlternativeRepository().alternativeNameAdd(event.alternativeAnimeName);
    //bool state = await AlternativeRepository().alternativeNameAdd(event);
    //yield AlternativeAdded(success: state);

    yield AlternativeAdded(success: true);
  }

  Stream<AlternativeGeted> _mapAlternativeGetName(AlternativeGetName event) async* {
    List<AlternativeAnimeName> alternativeNames = await AlternativeRepository().alternativeNameGet(event.animeId);
    yield AlternativeGeted(alternativeTitle: alternativeNames);
  }

  // Stream<AlternativeGeted> _mapAlternativeGetDescription(AlternativeGetDescription event) async* {
  //   List<AlternativeDescription> alternativeDescription = await AlternativeRepository().alternativeDescriptionGet(event.animeId);
  //   yield AlternativeGeted(alternativeTitle: alternativeDescription);
  // }

  // Stream<AlternativeDeleted> _mapAlternativeDelete(AlternativeDelete event) async* {
  //   bool status = await AlternativeRepository().alternativeDelete(event.alternativeTitle);
  //   yield AlternativeDeleted(success: status);
  // }
}