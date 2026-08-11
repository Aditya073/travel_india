import 'package:travel_india/features/hotels_page/data/models/hotel_model.dart';
import 'package:travel_india/networks/overpass_client.dart';

class DataFromApi {
  final OverpassClient overpassClient;

  DataFromApi({required this.overpassClient});

  Future<List<HotelModel>> getHotels(String stateName) async {
    final query = _buildQuery(stateName);

    // send the query to make the API call
    final data = await overpassClient.query(query);

    print("data.entries*******************************************");
    print(data.entries);

    // return the FORMATED data that we got from the API call
    return _parseHotels(data);
  }
}

// take the data from the API response and formates it
Future<List<HotelModel>> _parseHotels(Map<String, dynamic> data) async {
  final List elements = data['elements'] ?? [];

  // Map JSON array elements safely to your HotelModel list
  final List<HotelModel> hotels = elements.map((element) {
    // Ensure your HotelModel has a robust fromJson/fromMap constructor
    return HotelModel.fromJson(element);
  }).toList();

  return hotels;
}

String _buildQuery(String stateName) {
  return '''
   [out:json][timeout:30];

area["name"="$stateName"]["boundary"="administrative"]->.state;

(
  nwr["tourism"="hotel"]["name"](area.state);
);

out center 30;
    ''';
}