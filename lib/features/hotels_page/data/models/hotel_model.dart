class HotelModel {
  final String name;
  final String placeId;
  final String rating;
  final double latitude;
  final double longitude;
  final String osmType;
  final int osmId;

  HotelModel({
    required this.name,
    required this.placeId,
    required this.rating,
    required this.latitude,
    required this.longitude,
    required this.osmType,
    required this.osmId,
  });

  // factory HotelModel.fromJson(Map<String, dynamic> json) {
  // final tags = json['tags'] ?? {};

  // return HotelModel(
  //   name: tags['name'] ?? 'Unknown Hotel',
  //   placeId: json['place_id'] ?? '',

  //   //Since this is not avaliable in the api response thus i have manually given all of them a "3.0 stars"
  //   rating: tags['stars'] ?? '3.0',
  //   latitude: json['lat'] ?? json['center']?['lat'],
  //   longitude: json['lon'] ?? json['center']?['lon'],
  // );
  // }

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    final tags = Map<String, dynamic>.from(json['tags'] ?? {});

    final center = json['center'];

    double? latitude;
    double? longitude;

    // Node
    if (json['lat'] != null && json['lon'] != null) {
      latitude = (json['lat'] as num).toDouble();
      longitude = (json['lon'] as num).toDouble();
    }
    // Way / Relation
    else if (center != null) {
      latitude = (center['lat'] as num).toDouble();
      longitude = (center['lon'] as num).toDouble();
    }

    return HotelModel(
      osmId: json['id'] as int,
      osmType: json['type'] as String,
      name: tags['name']?.toString() ?? 'Unnamed Hotel',
      placeId: '',
      latitude: latitude ?? 0.0,
      longitude: longitude ?? 0.0,

      // Whatever other fields your model already has
      rating: tags['stars']!.toString(),
    );
  }

// getter fot the ID
  String get uniqueId {
    return '$osmType\_$osmId';
  }
}
