part of 'card_bloc.dart';

@immutable
sealed class CardEvent {}

class GetCardData extends CardEvent {}
