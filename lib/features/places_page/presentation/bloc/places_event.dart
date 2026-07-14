part of 'places_bloc.dart';

@immutable
sealed class PlacesEvent {}

class GetBeachEvent extends PlacesEvent {
  final String stateName;

  GetBeachEvent({required this.stateName});
}

class GetHistoricEvent extends PlacesEvent {
  final String stateName;

  GetHistoricEvent({required this.stateName});
}

class GetWaterFallEvent extends PlacesEvent {
  final String stateName;

  GetWaterFallEvent({required this.stateName});
}

class GetZooEvent extends PlacesEvent {
  final String stateName;

  GetZooEvent({required this.stateName});
}

class GetMuseumEvent extends PlacesEvent {
  final String stateName;

  GetMuseumEvent({required this.stateName});
}
