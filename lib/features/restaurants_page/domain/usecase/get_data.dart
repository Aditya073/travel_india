import 'package:travel_india/features/restaurants_page/data/model/restaurant_model.dart';
import 'package:travel_india/features/restaurants_page/data/repositories/restaurant_reopimpl.dart';

class GetData {
  final RestaurantReopimpl repository;

  GetData({required this.repository});

  Future<List<RestaurantModel>> getRestaurantDetail(String stateName) {
    return repository.getRestaurantDetail(stateName);
  }

  Future<List<RestaurantModel>> getCafeDetail(String stateName) {
    return repository.getCafeDetail(stateName);
  }
  

  Future<List<RestaurantModel>> getFastFoodDetail(String stateName) {
    return repository.getFastFoodDetail(stateName);
  }
  

  Future<List<RestaurantModel>> getFoodCourtDetail(String stateName) {
    return repository.getFoodCourtDetail(stateName);
  }
}
