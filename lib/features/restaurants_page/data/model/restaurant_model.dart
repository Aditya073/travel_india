class RestaurantModel {
  final String name;
  final double lat;
  final double lng;
  final String amenity; // cafe, restaurant, fast-food, food_court
  final bool? bar;

  RestaurantModel({
    required this.name,
    required this.lat,
    required this.lng,
    required this.amenity,
    required this.bar,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    final tags = json['tags'] ?? {};

    return RestaurantModel(
      name: tags['name'] ?? 'Unknown',
      lat: json['lat'],
      lng: json['lon'],
      amenity: tags['cafe'] ?? tags['fast_food'] ?? tags['restaurant'] ?? tags['food_court'],
      bar: tags['bar'] ?? false,
    );
  }
}
