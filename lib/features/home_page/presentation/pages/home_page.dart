import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeData _themeMode = AppTheme.lightTheme;

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,

        actions: [
          // IconButton(
          //   // theme toggle button  (used to select light or dark mode)
          //   icon: Icon(
          //     Theme.of(context).brightness == Brightness.dark
          //         ? Icons.light_mode
          //         : Icons.dark_mode,
          //   ),
          //   onPressed: () => toggleTheme(),
          // ),
        ],
      ),
      body: SizedBox(height: 120, width: 120, child: Column(children: [])),
    );
  }
}
