import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_india/features/restaurants_page/data/model/restaurant_model.dart';

class DataFromApiForResraurent {
  Future<List<RestaurantModel>> getRestaurantDetail(String stateName) async {
    try {
      final restaurantQuery =
          '''
[out:json];

area["name"="$stateName"]->.searchArea;

(
  node["amenity"="restaurant"](area.searchArea);
  way["amenity"="restaurant"](area.searchArea);
  relation["amenity"="restaurant"](area.searchArea);
);

out body center tags;
''';

      final response = await http
          .post(
            Uri.parse('https://overpass-api.de/api/interpreter'),
            headers: {
              // *** MANDATORY -> Identifies your app to prevent 406/403 blocks
              'User-Agent':
                  'TravelIndiaApp/1.0 (contact: support@travelindia.com)',
              'Accept': 'application/json',
            },
            body: {'data': restaurantQuery},
          )
          .timeout(const Duration(seconds: 40));

      if (response.statusCode != 200) {
        print(response.body);     // *************** print the OutPut ******
        return [];
      }

      if (!response.body.trim().startsWith('{')) {
        throw Exception('Expected JSON but got invalid content format.');
      }

      final data = jsonDecode(response.body);
      final List elements = data['elements'] ?? [];

      // Map JSON array elements safely to your RestaurantModel list
      final List<RestaurantModel> restaurans = elements.map((element) {
        return RestaurantModel.fromJson(element);
      }).toList();

      return restaurans;
    } catch (e) {
      print("API Error: $e");
      rethrow;
    }
  }

  Future<List<RestaurantModel>> getCafeDetail(String stateName) async {
    try {
      final cafeQuery =
          '''
[out:json];

area["name"="$stateName"]->.searchArea;

(
  node["amenity"="cafe"](area.searchArea);
  way["amenity"="cafe"](area.searchArea);
  relation["amenity"="cafe"](area.searchArea);
);

out body center tags;
''';

      final response = await http
          .post(
            Uri.parse('https://overpass-api.de/api/interpreter'),
            headers: {
              // *** MANDATORY -> Identifies your app to prevent 406/403 blocks
              'User-Agent':
                  'TravelIndiaApp/1.0 (contact: support@travelindia.com)',
              'Accept': 'application/json',
            },
            body: {'data': cafeQuery},
          )
          .timeout(const Duration(seconds: 40));

      if (response.statusCode != 200) {
        print(response.body);
        return [];
      }

      if (!response.body.trim().startsWith('{')) {
        throw Exception('Expected JSON but got invalid content format.');
      }

      final data = jsonDecode(response.body);
      final List elements = data['elements'] ?? [];

      // Map JSON array elements safely to your RestaurantModel list
      final List<RestaurantModel> cafes = elements.map((element) {
        return RestaurantModel.fromJson(element);
      }).toList();

      return cafes;
    } catch (e) {
      print("API Error: $e");
      rethrow;
    }
  }

  Future<List<RestaurantModel>> getFastFoodDetail(String stateName) async {
    try {
      final fast_foodQuery =
          '''
[out:json];

area["name"="$stateName"]->.searchArea;

(
  node["amenity"="fast_food"](area.searchArea);
  way["amenity"="fast_food"](area.searchArea);
  relation["amenity"="fast_food"](area.searchArea);
);

out body center tags;
''';

      final response = await http
          .post(
            Uri.parse('https://overpass-api.de/api/interpreter'),
            headers: {
              // *** MANDATORY -> Identifies your app to prevent 406/403 blocks
              'User-Agent':
                  'TravelIndiaApp/1.0 (contact: support@travelindia.com)',
              'Accept': 'application/json',
            },
            body: {'data': fast_foodQuery},
          )
          .timeout(const Duration(seconds: 40));

      if (response.statusCode != 200) {
        print(response.body);
        return [];
      }

      if (!response.body.trim().startsWith('{')) {
        throw Exception('Expected JSON but got invalid content format.');
      }

      final data = jsonDecode(response.body);
      final List elements = data['elements'] ?? [];

      // Map JSON array elements safely to your RestaurantModel list
      final List<RestaurantModel> fastFood = elements.map((element) {
        return RestaurantModel.fromJson(element);
      }).toList();

      return fastFood;
    } catch (e) {
      print("API Error: $e");
      rethrow;
    }
  }

  Future<List<RestaurantModel>> getFoodCourtDetail(String stateName) async {
    try {
      final food_courtQuery =
          '''
[out:json];

area["name"="$stateName"]->.searchArea;

(
  node["amenity"="food_court"](area.searchArea);
  way["amenity"="food_court"](area.searchArea);
  relation["amenity"="food_court"](area.searchArea);
);

out body center tags;
''';

      final response = await http
          .post(
            Uri.parse('https://overpass-api.de/api/interpreter'),
            headers: {
              // *** MANDATORY -> Identifies your app to prevent 406/403 blocks
              'User-Agent':
                  'TravelIndiaApp/1.0 (contact: support@travelindia.com)',
              'Accept': 'application/json',
            },
            body: {'data': food_courtQuery},
          )
          .timeout(const Duration(seconds: 40));

      if (response.statusCode != 200) {
        print(response.body);
        return [];
      }

      if (!response.body.trim().startsWith('{')) {
        throw Exception('Expected JSON but got invalid content format.');
      }

      final data = jsonDecode(response.body);
      final List elements = data['elements'] ?? [];

      // Map JSON array elements safely to your RestaurantModel list
      final List<RestaurantModel> foodCourts = elements.map((element) {
        return RestaurantModel.fromJson(element);
      }).toList();

      return foodCourts;
    } catch (e) {
      print("API Error: $e");
      rethrow;
    }
  }
}
