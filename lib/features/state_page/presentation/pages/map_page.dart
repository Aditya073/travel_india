import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final String? stateName;
  const MapPage({super.key, this.stateName});

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

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(27.1751, 78.0421), // India Center
    zoom: 9,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: Icon(Icons.logout),
          // ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        // markers: markers,
        // mapType: MapType.hybrid,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
