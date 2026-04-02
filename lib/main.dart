import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/auth/data/datasources/FirebaseAuthDataSource.dart';
import 'package:travel_india/features/auth/data/repositories/auth_repoImpl.dart';
import 'package:travel_india/features/auth/domain/usecases/loginUseCase.dart';
import 'package:travel_india/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:travel_india/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_india/features/auth/data/datasources/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        LoginUsecase(AuthRepoimpl(dataSource: FirebaseAuthDataSource())),
        SignUpUsercase(AuthRepoimpl(dataSource: FirebaseAuthDataSource())),
        GoogleSignInUseCase(AuthRepoimpl(dataSource: FirebaseAuthDataSource())),
        GuestSignInUserCase(AuthRepoimpl(dataSource: FirebaseAuthDataSource())),
        ForgotPasswordSignIn(AuthRepoimpl(dataSource: FirebaseAuthDataSource()), )
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel India',
        theme: AppTheme.lightTheme,
        home: LoginPage(),
      ),
    );
  }
}
