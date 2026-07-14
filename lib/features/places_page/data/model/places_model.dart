class PlacesModel {
  final String name;
  final String placeType;
  final double lat;
  final double lng;

  PlacesModel({
    required this.name,
    required this.placeType,
    required this.lat,
    required this.lng,
  });

  factory PlacesModel.fromJson(Map<String, dynamic> json) {
    final tags = json['tags'] ?? {};
    final center = json['center'] ?? {};

    return PlacesModel(
      name: tags['name'] ?? 'Unknown',
      placeType:
          tags['waterway'] ??  // waterfall
          tags['historic'] ?? // historic (monument, fort)
          tags['natural'] ??  // beach
          tags['tourism'] ??  // zoo, museum
          tags['leisure'] ??  // leisure(parks or playground)
          'Unknown',
      lat: ((json['lat'] ?? center['lat']) as num).toDouble(),
      lng: ((json['lon'] ?? center['lon']) as num).toDouble(),
    );
  }
}

/*

{
  "type": "way",
  "id": 112796885,
  "center": {
    "lat": 18.9781478,
    "lon": 72.8367841
  },
  "tags": {
    "addr:city": "Mumbai",
    "addr:postcode": "400027",
    "alt_name": "Rani Baug",
    "barrier": "wall",
    "fee": "yes",
    "name": "Veermata Jijabai Bhosale Zoo & Botanical Garden",
    "name:etymology:wikidata": "Q6192525",
    "old_name": "Victoria Gardens",
    "opening_hours": "Th-Tu 09:30-18:00",
    "tourism": "zoo",
    "wikidata": "Q647766"
  }
},



{
  "type": "node",
  "id": 342120591,
  "lat": 17.9227036,
  "lon": 73.6929569,
  "tags": {
    "name": "Lingmala Waterfalls",
    "name:mr": "लिंगमळा धबधबा",
    "waterway": "waterfall"
  }
},
{



{
  "type": "node",
  "id": 297521871,
  "lat": 21.1282013,
  "lon": 79.0669300,
  "tags": {
    "historic": "monument",
    "inscription": "This large Buddhist stupa.",
    "name": "Deekshabhoomi",
    "name:hi": "दीक्षाभूमी",
    "tourism": "attraction",
    "wikidata": "Q1182325",
    "wikipedia": "en:Deekshabhoomi"
  }
},
{
  "type": "node",
  "id": 342119741,
  "lat": 16.0427900,
  "lon": 73.4600899,
  "tags": {
    "historic": "fort",
    "name": "Sindhudurg Fort"
  }
},
{


{
  "type": "node",
  "id": 814449361,
  "lat": 19.2369057,
  "lon": 72.8426663,
  "tags": {
    "access": "yes",
    "addr:city": "yogi nagar borivali west mumbai",
    "addr:postcode": "mumbai-400091",
    "leisure": "playground",
    "name": "Ajmera Playground",
    "opening_hours": "Mo-Sa 09:00-18:00",
    "playground:theme": "playground",
    "surface": "ground"
  }
},



{
  "type": "node",
  "id": 674906629,
  "lat": 18.9791636,
  "lon": 72.8348012,
  "tags": {
    "name": "भाऊ दाजी लाड संग्रहालय",
    "name:en": "Bhau Daji Lad Museum (Victoria & Albert Museum)",
    "old_name": "Victoria & Albert Museum",
    "tourism": "museum",
    "wikidata": "Q5303985",
    "wikimedia_commons": "Category:Dr. Bhau Daji Lad Museum",
    "wikipedia": "en:Dr. Bhau Daji Lad Museum"
  }
},
*/
