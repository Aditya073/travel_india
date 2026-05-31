import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/auth/data/datasources/FirebaseAuthDataSource.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
// import 'package:cloudinary_flutter/image/cld_image.dart';
// import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:travel_india/features/auth/data/repositories/auth_repoImpl.dart';
import 'package:travel_india/features/auth/domain/usecases/loginUseCase.dart';
import 'package:travel_india/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:travel_india/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_india/features/auth/data/datasources/firebase_options.dart';
import 'package:travel_india/features/home_page/data/datasources/firestoreDataSource.dart';
import 'package:travel_india/features/home_page/data/repositories/card_repoImpl.dart';
import 'package:travel_india/features/home_page/domain/usecases/getCardData.dart';
import 'package:travel_india/features/home_page/presentation/bloc/card_bloc.dart';
import 'package:travel_india/features/home_page/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // ignore: deprecated_member_use
  CloudinaryContext.cloudinary = Cloudinary.fromCloudName(
    cloudName: "dhfegi9j2",
  );
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            LoginUsecase(AuthRepoimpl(dataSource: FirebaseAuthDataSource())),
            SignUpUsercase(AuthRepoimpl(dataSource: FirebaseAuthDataSource())),
            GoogleSignInUseCase(
              AuthRepoimpl(dataSource: FirebaseAuthDataSource()),
            ),
            GuestSignInUserCase(
              AuthRepoimpl(dataSource: FirebaseAuthDataSource()),
            ),
            ForgotPasswordSignIn(
              AuthRepoimpl(dataSource: FirebaseAuthDataSource()),
            ),
          ),
        ),
        BlocProvider<CardBloc>(
          create: (context) => CardBloc(
            GetcardData(
              repository: CardRepoimpl(datasource: Firestoredatasource()),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel India',
        theme: AppTheme.lightTheme,
        // home: LoginPage(),
        home: HomePage(),
      ),
    );
  }
}
