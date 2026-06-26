import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_india/features/hotels_page/data/models/hotel_model.dart';

class DataFromApi {
  Future<List<HotelModel>> getHotels(String state) async {
    final stateCoordinates = {
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
    final coords = stateCoordinates[state];

    if (coords == null) {
      throw Exception("Coordinates not found for $state");
    }

    final lat = coords['lat'];
    final lon = coords['lon'];

    print("!!!!!!!!!!!!!!!Lat: $lat, Lon: $lon !!!!!!!!!!!!!!!!!!!!!!");

    final query =
        '''
    [out:json][timeout:30];
    (
      node["tourism"="hotel"](around:50000,$lat,$lon);
      way["tourism"="hotel"](around:50000,$lat,$lon);
      relation["tourism"="hotel"](around:50000,$lat,$lon);
    );
    out center;
    ''';

    try {
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

      // Map JSON array elements safely to your HotelModel list
      final List<HotelModel> hotels = elements.map((element) {
        // Ensure your HotelModel has a robust fromJson/fromMap constructor
        return HotelModel.fromJson(element);
      }).toList();

      return hotels;
    } catch (e) {
      // Log or handle errors gracefully depending on your app's architecture
      print("API Error: $e");
      rethrow;
    }
  }
}
