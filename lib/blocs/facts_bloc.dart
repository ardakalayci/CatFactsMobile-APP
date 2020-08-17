import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:catfacts/blocs/facts_event.dart';
import 'package:catfacts/blocs/facts_state.dart';
import 'package:catfacts/data/data.dart';
import 'package:flutter/material.dart';




class FactsBloc extends Bloc<FactsEvent, FactsState> {
  FactsRepository factsRepository = FactsRepository();

  FactsBloc() : super(TrendingInitial());

  @override
  Stream<FactsState> mapEventToState(FactsEvent event) async* {
    if (event is AppStarted) {
      debugPrint("verigellioy");
      yield TrendingLoadingState();
      try {
        // Get city's weather details:
          final calledFacts = await factsRepository.getAllFacts();
          final calledRandomFacts = await factsRepository.getRandomFacts();
          debugPrint("verigeldiioy");

          yield TrendingLoadedState(allfacts: calledFacts,randomFacts:calledRandomFacts );

      } catch (e) {
        yield TrendingErrorState();
      }
    }
  }
}