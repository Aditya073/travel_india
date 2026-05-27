import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';

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
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                width: double.infinity / 6,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
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
