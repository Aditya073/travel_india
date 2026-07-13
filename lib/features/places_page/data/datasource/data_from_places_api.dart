import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_india/features/places_page/data/model/places_model.dart';

class DataFromPlacesApi {
  static const String _baseUrl = 'https://overpass-api.de/api/interpreter';

  static const stateCoordinates = {
    'Andhra Pradesh': {'lat': 15.9129, 'lon': 79.7400},
    'Arunachal Pradesh': {'lat': 28.2180, 'lon': 94.7278},
    'Assam': {'lat': 26.2006, 'lon': 92.9376},
    'Bihar': {'lat': 25.0961, 'lon': 85.3131},
    'Chhattisgarh': {'lat': 21.2787, 'lon': 81.8661},
    'Goa': {'lat': 15.2993, 'lon': 74.1240},
    'Gujarat': {'lat': 22.2587, 'lon': 71.1924},
    'Haryana': {'lat': 29.0588, 'lon': 76.0856},
    'Himachal Pradesh': {'lat': 31.1048, 'lon': 77.1734},
    'Jharkhand': {'lat': 23.6102, 'lon': 85.2799},
    'Karnataka': {'lat': 15.3173, 'lon': 75.7139},
    'Kerala': {'lat': 10.8505, 'lon': 76.2711},
    'Madhya Pradesh': {'lat': 22.9734, 'lon': 78.6569},
    'Maharashtra': {'lat': 19.0760, 'lon': 72.8777}, // Mumbai
    'Manipur': {'lat': 24.6637, 'lon': 93.9063},
    'Meghalaya': {'lat': 25.4670, 'lon': 91.3662},
    'Mizoram': {'lat': 23.1645, 'lon': 92.9376},
    'Nagaland': {'lat': 26.1584, 'lon': 94.5624},
    'Odisha': {'lat': 20.9517, 'lon': 85.0985},
    'Punjab': {'lat': 31.1471, 'lon': 75.3412},
    'Rajasthan': {'lat': 27.0238, 'lon': 74.2179},
    'Sikkim': {'lat': 27.5330, 'lon': 88.5122},
    'Tamil Nadu': {'lat': 11.1271, 'lon': 78.6569},
    'Telangana': {'lat': 18.1124, 'lon': 79.0193},
    'Tripura': {'lat': 23.9408, 'lon': 91.9882},
    'Uttar Pradesh': {'lat': 26.8467, 'lon': 80.9462}, // Lucknow
    'Uttarakhand': {'lat': 30.0668, 'lon': 79.0193},
    'West Bengal': {'lat': 22.9868, 'lon': 87.8550},
  };

  // 1.         ***********************************************************************************************

  Future<List<PlacesModel>> beach(String stateName) async {
    try {
      final String query =
          '''
[out:json][timeout:120];

area["name"="$stateName"]["boundary"="administrative"]->.searchArea;

(
  node["natural"="beach"](area.searchArea);
  way["natural"="beach"](area.searchArea);
  relation["natural"="beach"](area.searchArea);
);

out center tags;
''';

      final response = await http
          .post(
            Uri.parse(_baseUrl),
            headers: {
              'User-Agent':
                  'TravelIndiaApp/1.0 (contact: support@travelindia.com)',
              'Accept': 'application/json',
            },
            body: {'data': query},
          )
          .timeout(const Duration(seconds: 1000));

      if (response.statusCode != 200) {
        print("Status Code: ${response.statusCode}");
        print(response.body);
        return [];
      }

      if (!response.body.trim().startsWith('{')) {
        print(response.body);
        throw Exception("Overpass returned HTML instead of JSON.");
      }

      final json = jsonDecode(response.body);
      final List elements = json["elements"] ?? [];

      return elements.map((e) => PlacesModel.fromJson(e)).toList();
    } catch (e) {
      print("API Error: $e");
      return [];
    }
  }

  // 2.         ***********************************************************************************************

  Future<List<PlacesModel>> zoo(String stateName) async {
    try {
      final String query =
          '''
[out:json][timeout:120];

area["name"="$stateName"]["boundary"="administrative"]->.searchArea;

(
  node["tourism"="zoo"](area.searchArea);
  way["tourism"="zoo"](area.searchArea);
  relation["tourism"="zoo"](area.searchArea);
);

out center tags;
''';

      final response = await http
          .post(
            Uri.parse(_baseUrl),
            headers: {
              'User-Agent':
                  'TravelIndiaApp/1.0 (contact: support@travelindia.com)',
              'Accept': 'application/json',
            },
            body: {'data': query},
          )
          .timeout(const Duration(seconds: 1000));

      if (response.statusCode != 200) {
        print("Status Code: ${response.statusCode}");
        print(response.body);
        return [];
      }

      if (!response.body.trim().startsWith('{')) {
        print(response.body);
        throw Exception("Overpass returned HTML instead of JSON.");
      }

      final json = jsonDecode(response.body);
      final List elements = json["elements"] ?? [];

      return elements.map((e) => PlacesModel.fromJson(e)).toList();
    } catch (e) {
      print("API Error: $e");
      return [];
    }
  }

  // 3.        ***********************************************************************************************

  Future<List<PlacesModel>> waterFall(String stateName) async {
    try {
      final String query =
          '''
[out:json][timeout:120];

area["name"="$stateName"]["boundary"="administrative"]->.searchArea;

(
  node["waterway"="waterfall"](area.searchArea);
  way["waterway"="waterfall"](area.searchArea);
  relation["waterway"="waterfall"](area.searchArea);
);

out center tags;

''';

      final response = await http
          .post(
            Uri.parse(_baseUrl),
            headers: {
              'User-Agent':
                  'TravelIndiaApp/1.0 (contact: support@travelindia.com)',
              'Accept': 'application/json',
            },
            body: {'data': query},
          )
          .timeout(const Duration(seconds: 1000));

      if (response.statusCode != 200) {
        print("Status Code: ${response.statusCode}");
        print(response.body);
        return [];
      }

      if (!response.body.trim().startsWith('{')) {
        print(response.body);
        throw Exception("Overpass returned HTML instead of JSON.");
      }

      final json = jsonDecode(response.body);
      final List elements = json["elements"] ?? [];

      return elements.map((e) => PlacesModel.fromJson(e)).toList();
    } catch (e) {
      print("API Error: $e");
      return [];
    }
  }
}

/*


4.         ***********************************************************************************************
  [out:json][timeout:120];

area["name"="Maharashtra"]->.searchArea;

(
  node["historic"](area.searchArea);
);

out center tags;



5.         ***********************************************************************************************
  [out:json][timeout:120];

area["name"="Maharashtra"]->.searchArea;

(
  node["leisure"](area.searchArea);    ---> parks
);

out center tags;



6.         ***********************************************************************************************
[out:json][timeout:120];

area["name"="Maharashtra"]["boundary"="administrative"]->.searchArea;

(
  node["tourism"="museum"](area.searchArea);
  way["tourism"="museum"](area.searchArea);
  relation["tourism"="museum"](area.searchArea);
);

out center tags;
*/
