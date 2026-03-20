import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/auth/presentation/pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _themeMode = AppTheme.lightTheme;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == AppTheme.lightTheme
          ? AppTheme.darkTheme
          : AppTheme.lightTheme;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel India',
      theme: _themeMode,
      home: SignupPage(),

      //  HomePage(onToggleTheme: toggleTheme)
    );
  }
}
