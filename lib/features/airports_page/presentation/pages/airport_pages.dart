import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/airports_page/presentation/bloc/airports_bloc.dart';

class AirportPages extends StatefulWidget {
  final String stateName;
  const AirportPages({super.key, required this.stateName});

  @override
  State<AirportPages> createState() => _AirportPagesState();
}

class _AirportPagesState extends State<AirportPages> {

 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<AirportsBloc>().add(GetAirportEvent(widget.stateName));
  }


  @override
  Widget build(BuildContext context) {
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
      'Maharashtra': const LatLng(
        19.0760,
        72.8777,
      ), // Mumbai --> 'lat': 19.0760, 'lon': 72.8777
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
      return CameraPosition(
        target:
            stateCenters[state] ??
            const LatLng(20.5937, 78.9629), // India center
        zoom: 7,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          "Airports",
          style: TextStyle(
            color: AppTheme.powderBlue,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
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
                  // map container
                  Container(
                    height: MediaQuery.sizeOf(context).height / 2,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      color: AppTheme.iceBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GoogleMap(
                      initialCameraPosition: getCameraPosition(
                        widget.stateName,
                      ),
                      // markers: markers,
                      // mapType: MapType.hybrid,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                    ),
                  ),

                  // list of Airports present in the state
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    decoration: BoxDecoration(
                      color: AppTheme.iceBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: BlocBuilder<AirportsBloc, AirportsState>(
                      builder: (context, state) {
                        if (state is AirportsLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        }
                        if (state is Failure) {
                          throw (state.message);
                        }
                        if (state is Success) {
                          if (state.airports.isEmpty) {
                            return const Center(
                              child: Text(
                                "No Airports Found!!",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppTheme.darkColor,
                                ),
                              ),
                            );
                          }

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.airports.length,
                            itemBuilder: (context, index) {
                              final card = state.airports[index];
                              print(
                                "card.toString() in HotelPage Class!!!!!!!!!!!!!!!!!!",
                              );
                              print(card.toString());
                              return Container(

                              );
                            },
                          );
                        }

                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
