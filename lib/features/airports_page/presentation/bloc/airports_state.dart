part of 'airports_bloc.dart';

@immutable
sealed class AirportsState {}

final class AirportsInitial extends AirportsState {}

class AirportsLoading extends AirportsState {}

class Success extends AirportsState {
  // model
}

class Failure extends AirportsState {
  final String message;

  Failure({required this.message});
}
