part of 'hotels_bloc.dart';

@immutable
sealed class HotelsState {}

final class HotelsInitial extends HotelsState {}

class HotelsLoading extends HotelsState {}

class Success extends HotelsState {
  final List<HotelModel> card;

  Success({required this.card});
}

class Failure extends HotelsState {
  final String message;

  Failure({required this.message});
}
