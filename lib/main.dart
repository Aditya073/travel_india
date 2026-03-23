import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/auth/data/repositories/auth_repoImpl.dart';
import 'package:travel_india/features/auth/domain/repositories/auth_repo.dart';
import 'package:travel_india/features/auth/domain/usecases/loginUseCase.dart';
import 'package:travel_india/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:travel_india/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
    return BlocProvider(
    create: (context) => AuthBloc(LoginUsecase(AuthRepoimpl())),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel India',
      theme: _themeMode,
      home:  LoginPage(),

      //  HomePage(onToggleTheme: toggleTheme)
    ));
  }
}
