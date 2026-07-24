import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/places_page/presentation/bloc/places_bloc.dart';
import 'package:geocoding/geocoding.dart';

class PlacesPage extends StatefulWidget {
  final String stateName;
  const PlacesPage({super.key, required this.stateName});

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {


  @override
  void initState() {
    super.initState();
    context.read<PlacesBloc>().add(
      GetWaterFallEvent(stateName: widget.stateName),
    );
  }

  @override
  Widget build(BuildContext context) {
    Set<String> categoriesOfPlaces = {
      'Historic',
      'Beach',
      'Zoo',
      'Museum',
      'Leisure',
    };

    final Map<String, IconData> iconMap = {
      'Historic': Icons.fort_outlined,
      'Beach': Icons.beach_access,
      'Zoo': Icons.pets,
      'Museum': Icons.museum,
      'Leisure': Icons.sports_soccer,
    };

    String truncateWords(String text, int maxWords) {
      final words = text.split(' ');

      if (words.length <= maxWords) {
        return text;
      }
      return '${words.take(maxWords).join(' ')}...';
    }

    Future<String> getCityName(double lat, double lng) async {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

        if (placemarks.isNotEmpty) {
          return placemarks.first.locality ??
              placemarks.first.subAdministrativeArea ??
              placemarks.first.administrativeArea ??
              "Unknown";
        }

        return "Unknown";
      } catch (e) {
        print(e);
        return "Unknown";
      }
    }

    return Scaffold(
      body: Column(
        children: [
          // UPPER Container
          Container(
            decoration: BoxDecoration(color: AppTheme.darkColor),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                    child: Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.powderBlue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 10),
                    child: Text(
                      widget.stateName,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 25),
                      height: 55,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(16),

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
                          // ************ this should show the only results that is being typed ***************************************
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppTheme.powderBlue,
                            ),
                            hintText: "Search restaurants, cafas...",
                            hintStyle: TextStyle(
                              color: AppTheme.powderBlue,
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // upper Row
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppTheme.powderBlue),

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
                    child: SizedBox(
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoriesOfPlaces.length,
                        itemBuilder: (context, index) {
                          final category = categoriesOfPlaces.elementAt(index);

                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (context.read<PlacesBloc>().state
                                      is Loading) {
                                    return;
                                  }
                                  // Event
                                  switch (category) {
                                    case "Historic":
                                      context.read<PlacesBloc>().add(
                                        GetHistoricEvent(
                                          stateName: widget.stateName,
                                        ),
                                      );
                                      break;
                                    case 'Beach':
                                      context.read<PlacesBloc>().add(
                                        GetBeachEvent(
                                          stateName: widget.stateName,
                                        ),
                                      );
                                      break;

                                    case 'Zoo':
                                      context.read<PlacesBloc>().add(
                                        GetZooEvent(
                                          stateName: widget.stateName,
                                        ),
                                      );
                                      break;

                                    case 'Museum':
                                      context.read<PlacesBloc>().add(
                                        GetMuseumEvent(
                                          stateName: widget.stateName,
                                        ),
                                      );
                                      break;

                                    case 'Leisure':
                                      context.read<PlacesBloc>().add(
                                        GetleisureEvent(
                                          stateName: widget.stateName,
                                        ),
                                      );
                                      break;
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  child: Center(
                                    child: Icon(
                                      iconMap[category] ?? Icons.help_outline,
                                      size: 35,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: 70,
                                child: Text(
                                  category,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Waterfalls',
                          style: TextStyle(
                            color: AppTheme.darkColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),

                  BlocBuilder<PlacesBloc, PlacesState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        );
                      }
                      if (state is Failure) {
                        return Center(child: Text(state.message));
                      }
                      if (state is Success) {
                        if (state.palceModels.isEmpty) {
                          return const Center(
                            child: Text(
                              "No Places Found!!",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppTheme.darkColor,
                              ),
                            ),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: SizedBox(
                            height: 160,
                            child: ListView.builder(
                              padding: EdgeInsets.only(top: 5),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.palceModels.length,
                              itemBuilder: (context, index) {
                                final card = state.palceModels[index];

                                return SizedBox(
                                  width: 180,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      color: AppTheme.primaryColor,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Stack(
                                      clipBehavior: Clip.hardEdge,
                                      children: [
                                        // Decorative circle — top right
                                        Positioned(
                                          top: -12,
                                          right: -12,
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              color: AppTheme.darkColor
                                                  .withOpacity(0.25),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),

                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // Icon box
                                            Container(
                                              width: 38,
                                              height: 38,
                                              decoration: BoxDecoration(
                                                color: AppTheme.darkColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Icon(
                                                Icons.water_drop_outlined,
                                                color: Color(0xFFA6C5D8),
                                                size: 20,
                                              ),
                                            ),

                                            const SizedBox(height: 28),

                                            // Place name
                                            Text(
                                              // card.name,
                                              truncateWords(card.name, 4),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                height: 1.3,
                                              ),
                                            ),

                                            const SizedBox(height: 4),

                                            // Place type
                                            FutureBuilder<String>(
                                              future: getCityName(
                                                card.lat,
                                                card.lng,
                                              ),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const Text(
                                                    "Loading...",
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Color(0xFFA6C5D8),
                                                    ),
                                                  );
                                                }

                                                if (snapshot.hasError) {
                                                  return const Text("Unknown");
                                                }

                                                return Text(
                                                  "City:- ${snapshot.data ?? "Unknown"}",
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                    color: AppTheme.powderBlue,
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }

                      return const Center(
                        child: Text(
                          "Data Not found",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 8, bottom: 5),
                        child: Text(
                          'Nearby Places',
                          style: TextStyle(
                            color: AppTheme.darkColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // ****** main display *******
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppTheme.iceBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      child: BlocBuilder<PlacesBloc, PlacesState>(
                        builder: (context, state) {
                          if (state is Loading) {
                            return Center(
                              child: CircularProgressIndicator(color: Colors.black),
                            );
                          }
                          if (state is Failure) {
                            return Center(child: Text(state.message));
                          }
                          if (state is Success) {
                            if (state.palceModels.isEmpty) {
                              return const Center(
                                child: Text(
                                  "No Places Found!!",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppTheme.darkColor,
                                  ),
                                ),
                              );
                            }
                      
                            return ListView.builder(
                              padding: EdgeInsets.only(top: 5),
                              scrollDirection: Axis.vertical,
                              itemCount: state.palceModels.length,
                              itemBuilder: (context, index) {
                                final card = state.palceModels[index];
                      
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      // blue container
                                      Container(
                                        margin: EdgeInsets.all(15),
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: AppTheme.primaryColor,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Icon(
                                            // change the icon if it is cafe
                                            iconMap[card.placeType],
                      
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                      
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            // this makes it appear .... after 4 words
                                            truncateWords(card.name, 3),
                                            // card.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: AppTheme.darkColor,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            widget.stateName,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                      
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          // *** on click open the map
                      
                                          //   Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) => MapPage(
                                          //         stateName: widget.stateName,
                                          //         // Location of the restaurant and name
                                          //         name: card.name,
                                          //         lat: card.lat,
                                          //         lng: card.lng,
                                          //       ),
                                          //     ),
                                          //   );
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppTheme.powderBlue,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                      
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: const Center(
                              child: Text(
                                "Select From the above categorys",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppTheme.darkColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
