part of 'restaurants_bloc.dart';

@immutable
sealed class RestaurantsEvent {}


class GetRestaurantsEvent extends RestaurantsEvent {
  final String stateName;

  GetRestaurantsEvent(this.stateName);
}

class GetCafeEvent extends RestaurantsEvent {
  final String stateName;

  GetCafeEvent(this.stateName);
}

class GetFastFoodEvent extends RestaurantsEvent {
  final String stateName;

  GetFastFoodEvent(this.stateName);
}

class GetFoodCourtEvent extends RestaurantsEvent {
  final String stateName;

  GetFoodCourtEvent(this.stateName);
}
