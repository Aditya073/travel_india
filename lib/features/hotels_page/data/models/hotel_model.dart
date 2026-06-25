/*
                                    API RESPONSE ---> Openpass API
  "type": "node",
  "id": 1655879936,
  "lat": 15.5440140,
  "lon": 73.7663689,
  "tags": {
    "name": "Hotel Neelam Glitz",
    "tourism": "hotel"
  }
},
{
  "type": "node",
  "id": 1656639870,
  "lat": 15.5910323,
  "lon": 73.8103670,
  "tags": {
    "name": "Hotel Satyaheera",
    "tourism": "hotel"
  }
},
{
  "type": "node",
  "id": 1687186919,
  "lat": 15.4999998,
  "lon": 73.7699372,
  "tags": {
    "name": "Taj Holiday Village",
    "stars": "5",
    "tourism": "hotel",
    "website": "https://www.vivantabytaj.com/Holiday-Village-Goa/Overview.html"
  }
},
{
  "type": "node",
  "id": 1715059932,
  "lat
*/
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