import 'package:travel_india/features/hotels_page/data/models/hotel_model.dart';
import 'package:travel_india/features/hotels_page/data/models/search_area.dart';
import 'package:travel_india/networks/overpass_client.dart';

class DataFromApi {
  final OverpassClient overpassClient;

  DataFromApi({required this.overpassClient});

  // main shitttttttt
  Future<List<HotelModel>> getHotels(String stateName) async {
    try {
      // Get the bounding box of the selected state dynamically.

      final stateBounds = await _getStateBounds(stateName);
      if (stateBounds == null) {
        throw Exception('Could not find geographic bounds for $stateName');
      }

      print(
        'State bounds for $stateName: '
        '${stateBounds.south}, '
        '${stateBounds.west}, '
        '${stateBounds.north}, '
        '${stateBounds.east}',
      );

      // Divide the state bounding box into smaller areas.
      final areas = _createGrid(stateBounds);

      print('Created ${areas.length} search areas for $stateName');

      // Search each area.
      final Map<String, HotelModel> uniqueHotels = {};

      for (int i = 0; i < areas.length; i++) {
        final area = areas[i];

        print('Searching area ${i + 1}/${areas.length}');

        try {
          final query = _buildHotelQuery(area);

          final data = await overpassClient.query(query);

          final hotels = _parseHotels(data);

          // Remove duplicates......... Same hotel can appear in overlapping areas.
          for (final hotel in await hotels) {
            // added a getter in hotelModel for "uniqueId"
            uniqueHotels[hotel.uniqueId] = hotel;
          }

          print('Area ${i + 1} returned ${hotels.length} hotels');
        } catch (e) {
          print('Area ${i + 1} failed: $e');
        }
      }

      print('Total unique hotels: ${uniqueHotels.length}');

      return uniqueHotels.values.toList();
    } catch (e) {
      print('getHotels error: $e');
      rethrow;
    }
  }


  Future<SearchArea?> _getStateBounds(String stateName) async {
    final query =
        '''
[out:json][timeout:20];

rel
  ["boundary"="administrative"]
  ["admin_level"="4"]
  ["name"="$stateName"];

out bb;
''';

    final data = await overpassClient.query(query);

    final elements = data['elements'];

    if (elements == null || elements.isEmpty) {
      return null;
    }

    final element = elements.first;

    final bounds = element['bounds'];

    if (bounds == null) {
      return null;
    }

    return SearchArea(
      south: (bounds['minlat'] as num).toDouble(),
      west: (bounds['minlon'] as num).toDouble(),
      north: (bounds['maxlat'] as num).toDouble(),
      east: (bounds['maxlon'] as num).toDouble(),
    );
  }



  List<SearchArea> _createGrid(SearchArea bounds) {
    const double latStep = 1.0;
    const double lonStep = 1.0;

    final List<SearchArea> areas = [];

    double south = bounds.south;

    while (south < bounds.north) {
      final double north = (south + latStep > bounds.north)
          ? bounds.north
          : south + latStep;

      double west = bounds.west;

      while (west < bounds.east) {
        final double east = (west + lonStep > bounds.east)
            ? bounds.east
            : west + lonStep;

        areas.add(
          SearchArea(south: south, west: west, north: north, east: east),
        );

        west += lonStep;
      }

      south += latStep;
    }

    return areas;
  }



  String _buildHotelQuery(SearchArea area) {
    return '''
[out:json][timeout:20];

(
  nwr
    ["tourism"="hotel"]
    ["name"]
    (
      ${area.south},
      ${area.west},
      ${area.north},
      ${area.east}
    );
);

out center tags;
''';
  }


// take the data from the API response and formates it
  List<HotelModel> _parseHotels(Map<String, dynamic> data) {
    final List elements = data['elements'] ?? [];

    final List<HotelModel> hotels = [];

    for (final element in elements) {
      try { // Map JSON array elements safely to your HotelModel list
        final hotel = HotelModel.fromJson(Map<String, dynamic>.from(element));

        hotels.add(hotel);
      } catch (e) {
        print('Failed to parse hotel: $e');
      }
    }

    return hotels;
  }
}
