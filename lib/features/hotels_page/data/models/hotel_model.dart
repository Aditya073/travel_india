class HotelModel {
  final String name;
  final String placeId;
  final String rating;
  final double latitude;
  final double longitude;

  HotelModel({
    required this.name,
    required this.placeId,
    required this.rating,
    required this.latitude,
    required this.longitude,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
  final tags = json['tags'] ?? {};

  return HotelModel(
    name: tags['name'] ?? 'Unknown Hotel',
    placeId: json['place_id'] ?? '',

    //Since this is not avaliable in the api response thus i have manually given all of them a "3.0 stars"
    rating: tags['stars'] ?? '3.0',
    latitude: json['lat'] ?? json['center']?['lat'],
    longitude: json['lon'] ?? json['center']?['lon'],
  );
  }

}
