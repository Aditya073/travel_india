import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';

class PlacesPage extends StatefulWidget {
  final String stateName;
  const PlacesPage({super.key, required this.stateName});

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // UPPER Container
          Container(
            decoration: BoxDecoration(
              color: AppTheme.darkColor,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 10),
                    child: Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.iceBlue,
                      ),
                    ),),
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
                            prefixIcon: Icon(Icons.search, color: AppTheme.powderBlue),
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
        ],
      ),
    );
  }
}
