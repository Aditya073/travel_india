import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/Config/Widgets/state_builder/airports_card.dart';
import 'package:travel_india/Config/Widgets/state_builder/hotels_card.dart';
import 'package:travel_india/Config/Widgets/state_builder/map_card.dart';
import 'package:travel_india/Config/Widgets/state_builder/places_card.dart';
import 'package:travel_india/Config/Widgets/state_builder/restaurants_card.dart';

/*
State name
*/

class StatePage extends StatelessWidget {
  final String? stateName;
  const StatePage({super.key, required this.stateName});
  

  @override
  Widget build(BuildContext context) {
    final List<Widget> cards = [
      MapCard(),
      PlacesCard(),
      HotelsCard(),
      RestaurantsCard(),
      AirportsCard(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          '$stateName',
          style: TextStyle(
            color: AppTheme.powderBlue,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      
      //       // hotels card  ---> with reviews
      //       // places to visit card  ---> with reviews
      //       // restaurants card
      //       // airports card

      body: GridView.builder(
        // Grid layout (2 items per row)
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.95,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return cards[index];
        },
      ),
    );
  }
}
