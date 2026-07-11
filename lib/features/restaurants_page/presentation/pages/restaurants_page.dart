import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/restaurants_page/presentation/bloc/restaurants_bloc.dart';
import 'package:travel_india/Config/Widgets/map_page.dart';

class RestaurantsPage extends StatefulWidget {
  final String stateName;

  const RestaurantsPage({super.key, required this.stateName});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  Set<String> categoriesOfRestaurant = {
    'Restaurants',
    'Cafas',
    'Fast Food',
    'Food Court',
  };

  @override
  Widget build(BuildContext context) {
    String truncateWords(String text, int maxWords) {
      final words = text.split(' ');

      if (words.length <= maxWords) {
        return text;
      }
      return '${words.take(maxWords).join(' ')}...';
    }

    return Scaffold(
      body: Column(
        children: [
          // uppre container
          Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              // borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 10),
                    child: Text(
                      'Find a Place to eat',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.iceBlue,
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
                        color: Colors.blueGrey[100],
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
                          // this should show the only results that is being typed
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                            hintText: "Search restaurants, cafas...",
                            hintStyle: TextStyle(
                              color: Colors.black54,
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

          // Lower Containrt
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppTheme.powderBlue),
              child: Column(
                children: [
                  // Categories
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoriesOfRestaurant.length,
                      itemBuilder: (context, index) {
                        final category = categoriesOfRestaurant.elementAt(
                          index,
                        );

                        return GestureDetector(
                          onTap: () {
                            // Event
                            switch (category) {
                              case "Restaurants":
                                context.read<RestaurantsBloc>().add(
                                  GetRestaurantsEvent(widget.stateName),
                                );
                                break;
                              case 'Cafas':
                                context.read<RestaurantsBloc>().add(
                                  GetCafeEvent(widget.stateName),
                                );
                                break;

                              case 'Fast Food':
                                context.read<RestaurantsBloc>().add(
                                  GetFastFoodEvent(widget.stateName),
                                );
                                break;

                              case 'Food Court':
                                context.read<RestaurantsBloc>().add(
                                  GetFoodCourtEvent(widget.stateName),
                                );
                                break;
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // ****** main display *******
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppTheme.iceBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: BlocBuilder<RestaurantsBloc, RestaurantsState>(
                        builder: (context, state) {
                          if (state is Loading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            );
                          }
                          if (state is Failure) {
                            Center(child: Text(state.message));
                          }
                          if (state is Success) {
                            if (state.restaurant.isEmpty) {
                              return const Center(
                                child: Text(
                                  "No Restaurants Found!!",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppTheme.darkColor,
                                  ),
                                ),
                              );
                            }

                            return ListView.builder(
                              // shrinkWrap: true,
                              padding: EdgeInsets.only(top: 5),
                              scrollDirection: Axis.vertical,
                              itemCount: state.restaurant.length,
                              itemBuilder: (context, index) {
                                final card = state.restaurant[index];

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
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Icon(
                                            // change the icon if it is cafe
                                            Icons.restaurant,
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
                                            truncateWords(card.name, 4),
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

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MapPage(
                                                stateName: widget.stateName,
                                                // Location of the restaurant and name
                                                name: card.name,
                                                lat: card.lat,
                                                lng: card.lng,
                                              ),
                                            ),
                                          );
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

                          return const Center(
                            child: Text(
                              "Select From the above categorys",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppTheme.darkColor,
                                fontWeight: FontWeight.w500,
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
