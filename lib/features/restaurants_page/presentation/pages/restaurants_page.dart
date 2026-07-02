import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';

class RestaurantsPage extends StatefulWidget {
  final String stateName;

  const RestaurantsPage({super.key, required this.stateName});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  Set<String> categories = {'Restaurants', 'Cafas', 'Fast Food', 'Food Court'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // uppre container
          Container(
            decoration: BoxDecoration(color: AppTheme.primaryColor),
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
          Container(
            decoration: BoxDecoration(color: AppTheme.powderBlue),
            height: 100,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: ClipOval(
                              child: Card(
                                color: AppTheme.iceBlue,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text("$index"),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
