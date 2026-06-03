part of 'card_bloc.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

class CardLoading extends CardState {}

class Success extends CardState {
  final List<CardModel> card;

  Success({required this.card});
}


 class Failure extends CardState{
  final String message;

  Failure({required this.message});
 }