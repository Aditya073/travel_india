import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';

/*
State name
*/

class StatePage extends StatelessWidget {
  final String? stateName;
  const StatePage({super.key, required this.stateName});

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,

        child: Column(children: [

          ],
        ),
      ),
    );
  }
}
