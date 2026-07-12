import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';

class MapPage extends StatefulWidget {
  final String stateName;
  final String name;
  final double lat;
  final double lng;
  const MapPage({
    super.key,
    required this.stateName,
    required this.lat,
    required this.lng,
    required this.name,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  //   Future<void> getPermission() async {
  //   LocationPermission permission =
  //       await Geolocator.requestPermission();

  //   if (permission == LocationPermission.denied) {
  //     return;
  //   }
  // }

  //   final Set<Marker> markers = {
  //   Marker(
  //     markerId: MarkerId('taj'),
  //     position: LatLng(27.1751, 78.0421),
  //     infoWindow: InfoWindow(title: 'Taj Mahal'),
  //   ),

  //   Marker(
  //     markerId: MarkerId('gateway'),
  //     position: LatLng(18.9220, 72.8347),
  //     infoWindow: InfoWindow(title: 'Gateway of India'),
  //   ),
  // };
  Set<Marker> markers = {};

  CameraPosition getCameraPosition(String state) {
    return CameraPosition(
      target: LatLng(widget.lat, widget.lng), // India center
      zoom: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    markers.add(
      Marker(
        markerId: MarkerId(widget.name),
        position: LatLng(widget.lat, widget.lng),
        infoWindow: InfoWindow(title: widget.name),
      ),
    );

    final stateCoordinates = {
      'Andhra Pradesh': {'lat': 15.9129, 'lon': 79.7400},
      'Arunachal Pradesh': {'lat': 28.2180, 'lon': 94.7278},
      'Assam': {'lat': 26.2006, 'lon': 92.9376},
      'Bihar': {'lat': 25.0961, 'lon': 85.3131},
      'Chhattisgarh': {'lat': 21.2787, 'lon': 81.8661},
      'Goa': {'lat': 15.2993, 'lon': 74.1240},
      'Gujarat': {'lat': 22.2587, 'lon': 71.1924},
      'Haryana': {'lat': 29.0588, 'lon': 76.0856},
      'Himachal Pradesh': {'lat': 31.1048, 'lon': 77.1734},
      'Jharkhand': {'lat': 23.6102, 'lon': 85.2799},
      'Karnataka': {'lat': 15.3173, 'lon': 75.7139},
      'Kerala': {'lat': 10.8505, 'lon': 76.2711},
      'Madhya Pradesh': {'lat': 22.9734, 'lon': 78.6569},
      'Maharashtra': {'lat': 19.0760, 'lon': 72.8777}, // Mumbai
      'Manipur': {'lat': 24.6637, 'lon': 93.9063},
      'Meghalaya': {'lat': 25.4670, 'lon': 91.3662},
      'Mizoram': {'lat': 23.1645, 'lon': 92.9376},
      'Nagaland': {'lat': 26.1584, 'lon': 94.5624},
      'Odisha': {'lat': 20.9517, 'lon': 85.0985},
      'Punjab': {'lat': 31.1471, 'lon': 75.3412},
      'Rajasthan': {'lat': 27.0238, 'lon': 74.2179},
      'Sikkim': {'lat': 27.5330, 'lon': 88.5122},
      'Tamil Nadu': {'lat': 11.1271, 'lon': 78.6569},
      'Telangana': {'lat': 18.1124, 'lon': 79.0193},
      'Tripura': {'lat': 23.9408, 'lon': 91.9882},
      'Uttar Pradesh': {'lat': 26.8467, 'lon': 80.9462}, // Lucknow
      'Uttarakhand': {'lat': 30.0668, 'lon': 79.0193},
      'West Bengal': {'lat': 22.9868, 'lon': 87.8550},
    };
    final coords = stateCoordinates[widget.stateName];

    if (coords == null) {
      throw Exception("Coordinates not found for ${widget.stateName}");
    }

    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: AppTheme.iceBlue,
          child: Text(
            widget.name,
            
          style: TextStyle(
            color: AppTheme.powderBlue,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppTheme.powderBlue),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: GoogleMap(
        initialCameraPosition: getCameraPosition(widget.stateName),
        markers: markers,
        // mapType: MapType.hybrid,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
