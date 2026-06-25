part of 'hotels_bloc.dart';

@immutable
sealed class HotelsEvent {}

class GetHotelsEvent extends HotelsEvent {
  final String stateName;

  GetHotelsEvent(this.stateName);
}
