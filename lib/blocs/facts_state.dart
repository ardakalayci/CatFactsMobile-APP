
import 'package:catfacts/model/all_facts.dart';
import 'package:catfacts/model/random_facts.dart';
import 'package:equatable/equatable.dart';

abstract class FactsState extends Equatable {
  const FactsState();
}

class TrendingInitial extends FactsState {
  @override
  List<Object> get props => [];
}

class TrendingLoadingState extends FactsState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class TrendingLoadedState extends FactsState {
  AllFacts allfacts;
  RandomFacts randomFacts;

  TrendingLoadedState({this.allfacts,this.randomFacts});

  @override
  List<Object> get props => [allfacts];
}

class TrendingErrorState extends FactsState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}