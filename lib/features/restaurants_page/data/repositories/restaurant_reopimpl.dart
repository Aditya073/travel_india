import 'package:travel_india/features/restaurants_page/data/datasource/data_from_api.dart';
import 'package:travel_india/features/restaurants_page/data/model/restaurant_model.dart';

class RestaurantReopimpl {
  final DataFromApi datasource;
  RestaurantReopimpl({required this.datasource});

  Future<List<RestaurantModel>> getRestaurantDetail(String stateName) {
    return datasource.getRestaurantDetail(stateName);
  }

  Future<List<RestaurantModel>> getCafeDetail(String stateName) {
    return datasource.getCafeDetail(stateName);
  }

  Future<List<RestaurantModel>> getFastFoodDetail(String stateName) {
    return datasource.getFastFoodDetail(stateName);
  }

  Future<List<RestaurantModel>> getFoodCourtDetail(String stateName) {
    return datasource.getFoodCourtDetail(stateName);
  }
}
