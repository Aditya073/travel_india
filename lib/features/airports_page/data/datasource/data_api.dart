import 'package:travel_india/features/airports_page/data/model/airport_model.dart';
import 'package:travel_india/networks/overpass_client.dart';

class DataApi {
  final OverpassClient overpassClient;

  DataApi({required this.overpassClient});

  Future<List<AirportModel>> getAirportDetails(String stateName) async {
    final query = _buildQuery(stateName);

    final data = await overpassClient.query(query);

    return _parseAirports(data);
  }
}

Future<List<AirportModel>> _parseAirports(Map<String, dynamic> data) async {
  final List elements = data['elements'] ?? [];

  // Map JSON array elements safely to your AirportModel list
  final List<AirportModel> airports = elements.map((element) {
    // Ensure your AirportModel has a robust fromJson/fromMap constructor
    return AirportModel.fromJson(element);
  }).toList();

  return airports;
}

String _buildQuery(String stateName) {

  return '''
 [out:json][timeout:25];

 area["name"="$stateName"]->.searchArea;

 (
   node["aeroway"="aerodrome"](area.searchArea);
   way["aeroway"="aerodrome"](area.searchArea);
   relation["aeroway"="aerodrome"](area.searchArea);
 );

 out center tags;
    ''';
}
