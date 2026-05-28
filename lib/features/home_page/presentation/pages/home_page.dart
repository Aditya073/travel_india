import 'package:flutter/material.dart';
import 'package:travel_india/Config/Widgets/travel_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ThemeData _themeMode = AppTheme.lightTheme;

  // void toggleTheme() {
  //   setState(() {
  //     _themeMode = _themeMode == AppTheme.lightTheme
  //         ? AppTheme.darkTheme
  //         : AppTheme.lightTheme;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor),

      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,

        child: Column(
          children: [
            // SEARCH BAR
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: "Search Destination",
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

            // CARD SECTION
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    TravelCard(),
                    SizedBox(height: 25),
                    TravelCard(),
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
