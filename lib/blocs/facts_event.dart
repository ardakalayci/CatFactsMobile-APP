import 'package:equatable/equatable.dart';

abstract class FactsEvent extends Equatable {
  const FactsEvent();
  List<Object> get props => throw [];

}
class AppStarted extends FactsEvent {

}
// ignore: must_be_immutable
class FetchTrendingEvent extends FactsEvent {
  List<FactsEvent> _servicesList = List<FactsEvent>();

  @override
  // TODO: implement props
  List<Object> get props => [_servicesList];
}

class RefreshTrendingEvent extends FactsEvent {


  @override
  // TODO: implement props
  List<Object> get props => [];
}