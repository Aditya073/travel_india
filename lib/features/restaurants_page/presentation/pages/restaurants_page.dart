import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/restaurants_page/presentation/bloc/restaurants_bloc.dart';

class RestaurantsPage extends StatefulWidget {
    final String stateName;

  const RestaurantsPage({super.key, required this.stateName});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          "Restaurants",
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
                    hintText: "Search Restaurants...",
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
                      markers: markers,
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
                    child: BlocBuilder<RestaurantsBloc, RestaurantsState>(
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
                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 15,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      // Navigate to detail screen
                                    },
                                    borderRadius: BorderRadius.circular(18),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(18),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppTheme.primaryColor
                                                .withOpacity(0.07),
                                            blurRadius: 14,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 14,
                                        ),
                                        child: Row(
                                          children: [
                                            // Icon
                                            Container(
                                              width: 46,
                                              height: 46,
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    AppTheme.primaryColor,
                                                    Color(0xFF1A6DE0),
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(13),
                                              ),
                                              child: const Icon(
                                                Icons.flight_takeoff_rounded,
                                                color: Colors.white,
                                                size: 22,
                                              ),
                                            ),
                                            const SizedBox(width: 14),

                                            // Name + coordinates
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    card.name,
                                                    style: const TextStyle(
                                                      color: AppTheme.darkColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.3,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 10),

                                            // IATA badge + chevron
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                card.iata.isNotEmpty
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 4,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              AppTheme.iceBlue,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                          border: Border.all(
                                                            color: AppTheme
                                                                .powderBlue
                                                                .withOpacity(
                                                                  0.5,
                                                                ),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          card.iata,
                                                          style: const TextStyle(
                                                            color: AppTheme
                                                                .primaryColor,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            letterSpacing: 1.2,
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal: 8,
                                                              vertical: 4,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .powderBlue
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                        ),
                                                        child: const Text(
                                                          'HELIPORT',
                                                          style: TextStyle(
                                                            color: Color(
                                                              0xFF5A7A99,
                                                            ),
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            letterSpacing: 0.8,
                                                          ),
                                                        ),
                                                      ),
                                                const SizedBox(height: 6),
                                                const Icon(
                                                  Icons.chevron_right_rounded,
                                                  color: AppTheme.powderBlue,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // this will call the function to mark the location of the hotels on the map
          setState(() {
            markers = gethotelMarker(
              (context.read<AirportsBloc>().state as Success).airports,
            );
          });
        },
        backgroundColor: AppTheme.darkColor,
        child: Icon(Icons.location_on_outlined, color: AppTheme.iceBlue),
      ),
    );
  }
}