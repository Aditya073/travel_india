import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_india/features/hotels_page/data/models/hotel_model.dart';

class DataFromApi {
  Future<List<HotelModel>> getHotels(String state) async {

    final query =
        '''
[out:json];
area["name"="$state"]->.searchArea;

(
  node["tourism"="hotel"](area.searchArea);
  way["tourism"="hotel"](area.searchArea);
  relation["tourism"="hotel"](area.searchArea);
);

out center;
''';
    final url =
        'https://overpass-api.de/api/interpreter?data=${Uri.encodeComponent(query)}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data.toString());
      return data;
    }

    return [];
  }
}
