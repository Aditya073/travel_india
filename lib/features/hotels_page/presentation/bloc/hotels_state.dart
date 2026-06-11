part of 'hotels_bloc.dart';

@immutable
sealed class HotelsState {}

final class HotelsInitial extends HotelsState {}

class Success extends HotelsState {
  // final List<CardModel> card;
  // create a model for list of hotels
  /*
  1. name
  2. Position(
      loc['lat'],
      loc['lng'],
    ),
  3. image
  4. contact info
  5. reviews
  6.  

  */

  Success();
}


 class Failure extends HotelsState{
  final String message;

  Failure({required this.message});
 }
