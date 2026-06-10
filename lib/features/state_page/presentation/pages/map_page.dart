import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

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

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(20.5937, 78.9629), // India Center
    zoom: 4,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
