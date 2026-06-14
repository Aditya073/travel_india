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

    const CameraPosition initialPosition = CameraPosition(
      target: LatLng(27.1751, 78.0421), // India Center
      zoom: 9,
    );
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
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      decoration: BoxDecoration(
                        color: AppTheme.iceBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GoogleMap(
                        initialCameraPosition: initialPosition,
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






              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         BlocBuilder<hotelsBloc, hotelsState>(
              //           builder: (context, state) {
              //             if (state is CardLoading) {
              //               return const Center(
              //                 child: CircularProgressIndicator(),
              //               );
              //             }
              //             if (state is Failure) {
              //               return Center(
              //                 child: Text(
              //                   state.message,
              //                   style: TextStyle(fontSize: 24),
              //                 ),
              //               );
              //             }
              //             if (state is Success) {
              //               return ListView.builder(
              //                 shrinkWrap: true,
              //                 physics: NeverScrollableScrollPhysics(),
              //                 itemCount: state.card.length,
              //                 itemBuilder: (context, index) {
              //                   final card = state.card[index];

              //                   return Padding(
              //                     padding: const EdgeInsets.only(
              //                       bottom: 25,
              //                       left: 20,
              //                       right: 20,
              //                     ),
              //                     child: TravelCard(
              //                       stateName: card.stateName,
              //                       image: card.imageUrl,
              //                       description: card.description,
              //                     ),
              //                   );
              //                 },
              //               );
              //             }
              //             return const Center(
              //               child: Text("Something went wrong"),
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),