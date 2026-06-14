import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';

class HotelsPage extends StatelessWidget {
  final String stateName;
  const HotelsPage({super.key, required this.stateName});

  @override
  Widget build(BuildContext context) {
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

    final Map<String, LatLng> stateCenters = {
      'Andhra Pradesh': const LatLng(15.9129, 79.7400),
      'Arunachal Pradesh': const LatLng(28.2180, 94.7278),
      'Assam': const LatLng(26.2006, 92.9376),
      'Bihar': const LatLng(25.0961, 85.3131),
      'Chhattisgarh': const LatLng(21.2787, 81.8661),
      'Goa': const LatLng(15.2993, 74.1240),
      'Gujarat': const LatLng(22.2587, 71.1924),
      'Haryana': const LatLng(29.0588, 76.0856),
      'Himachal Pradesh': const LatLng(31.1048, 77.1734),
      'Jharkhand': const LatLng(23.6102, 85.2799),
      'Karnataka': const LatLng(15.3173, 75.7139),
      'Kerala': const LatLng(10.8505, 76.2711),
      'Madhya Pradesh': const LatLng(22.9734, 78.6569),
      'Maharashtra': const LatLng(19.7515, 75.7139),
      'Manipur': const LatLng(24.6637, 93.9063),
      'Meghalaya': const LatLng(25.4670, 91.3662),
      'Mizoram': const LatLng(23.1645, 92.9376),
      'Nagaland': const LatLng(26.1584, 94.5624),
      'Odisha': const LatLng(20.9517, 85.0985),
      'Punjab': const LatLng(31.1471, 75.3412),
      'Rajasthan': const LatLng(27.0238, 74.2179),
      'Sikkim': const LatLng(27.5330, 88.5122),
      'Tamil Nadu': const LatLng(11.1271, 78.6569),
      'Telangana': const LatLng(18.1124, 79.0193),
      'Tripura': const LatLng(23.9408, 91.9882),
      'Uttar Pradesh': const LatLng(26.8467, 80.9462),
      'Uttarakhand': const LatLng(30.0668, 79.0193),
      'West Bengal': const LatLng(22.9868, 87.8550),
    };

    CameraPosition getCameraPosition(String state) {
      return CameraPosition(target: stateCenters[state]!, zoom: 7);
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 55,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(12),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: const TextField(
                    // this should show the only results that is being typed
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: "Search Hotels...",
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /*  Map card
        ┌─────────────────────┐
        │       MAP           │
        │   📍 📍 📍 📍     │
        └─────────────────────┘

        */
                    Container(
                      height: MediaQuery.sizeOf(context).height / 2,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        color: AppTheme.iceBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GoogleMap(
                        initialCameraPosition: getCameraPosition(stateName),
                        // markers: markers,
                        // mapType: MapType.hybrid,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                      ),
                    ),

                    /*
        
        
        Hotels Nearby
        ┌─────────────────────┐
        │ 🏨 Taj Hotel        │
        │ ⭐ 4.5              │
        └─────────────────────┘
        
        ┌─────────────────────┐
        │ 🏨 Imperial Palace  │
        │ ⭐ 4.2              │
        └─────────────────────┘
        */
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
