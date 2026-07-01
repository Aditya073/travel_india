part of 'restaurants_bloc.dart';

@immutable
sealed class RestaurantsState {}

final class RestaurantsInitial extends RestaurantsState {}

class RestaurantsLoading extends RestaurantsState {}

class Success extends RestaurantsState {
  // model
  final List<RestaurantModel> airports;

  Success({required this.airports}); 
}

class Failure extends RestaurantsState {
  final String message;

  Failure({required this.message});
}
