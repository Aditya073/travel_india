part of 'airports_bloc.dart';

@immutable
sealed class AirportsEvent {}

class GetAirportEvent extends AirportsEvent {
  final String stateName;

  GetAirportEvent(this.stateName);
}
