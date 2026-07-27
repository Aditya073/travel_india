part of 'places_bloc.dart';

@immutable
sealed class PlacesState {}

final class PlacesInitial extends PlacesState {}

class Loading extends PlacesState {}


class WaterfallLoading extends PlacesState {}

class Success extends PlacesState {
  final List<PlacesModel> palceModels;

  Success({required this.palceModels});
}

class Failure extends PlacesState {
  final String message;

  Failure({required this.message});
}
