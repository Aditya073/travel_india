import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_india/features/airports_page/data/model/airport_model.dart';

class DataApi {
  Future<List<AirportModel>> getAirportDetails(String state) async {


    try { //************** ask claud to design the card for it************************
      final query =
          '''
[out:json][timeout:25];

area["name"="$state"]->.searchArea;

(
  node["aeroway"="aerodrome"](area.searchArea);
  way["aeroway"="aerodrome"](area.searchArea);
  relation["aeroway"="aerodrome"](area.searchArea);
);

out center tags;
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
            body: {'data': query},
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

      // Map JSON array elements safely to your AirportModel list
      final List<AirportModel> airports = elements.map((element) {
        return AirportModel.fromJson(element);
      }).toList();

      return airports;
    } catch (e) {
      print("API Error: $e");
      rethrow;
    }
  }
}
