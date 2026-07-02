part of 'restaurants_bloc.dart';

@immutable
sealed class RestaurantsState {}

final class RestaurantsInitial extends RestaurantsState {}

class Loading extends RestaurantsState {}

class Success extends RestaurantsState {
  // model
  final List<RestaurantModel> restaurant;

  Success({required this.restaurant}); 
}

class Failure extends RestaurantsState {
  final String message;

  Failure({required this.message});
}
