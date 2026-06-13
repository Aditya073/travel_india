import 'dart:convert';
import 'package:http/http.dart' as http;

class DataFromApi {
  Future<List<dynamic>> getHotels(String state) async {
    // HIDE THE KEY BEFORE MAKING TS PUBLIC
    // const apiKey = "AIzaSyD7rseKaAYDSM7gm_a0Yk6Nz-JttfZRlRw";

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
