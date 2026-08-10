import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/airports_page/data/datasource/data_api.dart';
import 'package:travel_india/features/airports_page/data/repositories/airport_repoimpl.dart';
import 'package:travel_india/features/airports_page/domain/usecase/get_data.dart';
import 'package:travel_india/features/airports_page/presentation/bloc/airports_bloc.dart';
import 'package:travel_india/features/auth/data/datasources/FirebaseAuthDataSource.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:travel_india/features/auth/data/repositories/auth_repoImpl.dart';
import 'package:travel_india/features/auth/domain/usecases/loginUseCase.dart';
import 'package:travel_india/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_india/features/auth/data/datasources/firebase_options.dart';
import 'package:travel_india/features/auth/presentation/pages/login_page.dart';
import 'package:travel_india/features/home_page/data/datasources/firestoreDataSource.dart';
import 'package:travel_india/features/home_page/data/repositories/card_repoImpl.dart';
import 'package:travel_india/features/home_page/domain/usecases/getCardData.dart';
import 'package:travel_india/features/home_page/presentation/bloc/card_bloc.dart';
import 'package:travel_india/features/hotels_page/data/datasources/data_from_api.dart';
import 'package:travel_india/features/hotels_page/data/repositories/hotels_repoImpl.dart';
import 'package:travel_india/features/hotels_page/domain/usecases/get_data.dart';
import 'package:travel_india/features/hotels_page/presentation/bloc/hotels_bloc.dart';
import 'package:travel_india/features/places_page/data/datasource/data_from_places_api.dart';
import 'package:travel_india/features/places_page/data/repositories/places_reopimpl.dart';
import 'package:travel_india/features/places_page/domain/usecase/get_places_data.dart';
import 'package:travel_india/features/places_page/presentation/bloc/places_bloc.dart';
import 'package:travel_india/features/restaurants_page/data/datasource/data_from_api.dart';
import 'package:travel_india/features/restaurants_page/data/repositories/restaurant_reopimpl.dart';
import 'package:travel_india/features/restaurants_page/domain/usecase/get_data.dart';
import 'package:travel_india/features/restaurants_page/presentation/bloc/restaurants_bloc.dart';


/*           How the Final Architecture should look like
                    ┌─────────────────┐
                    │    Flutter UI   │
                    └────────┬────────┘
                             ↓
                         BLoC/Cubit
                             ↓
                         Use Case
                             ↓
                        Repository
                             ↓
                    ┌────────┴─────────┐
                    ↓                  ↓
               Local Cache        Remote Source
                    │                  ↓
                    │             Your Backend
                    │                  ↓
                    │             API Services
                    │                  ↓
                    │              Overpass
                    │                 
                    └──────────→ Model

                    */

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
        BlocProvider<HotelsBloc>(
          create: (context) => HotelsBloc(
            GetHotelsData(
              repository: HotelsRepoimpl(dataSource: DataFromApi()),
            ),
          ),
        ),
        BlocProvider<AirportsBloc>(
          create: (context) => AirportsBloc(
            GetAirportData(repository: AirportRepoimpl(dataSource: DataApi())),
          ),
        ),
        BlocProvider<RestaurantsBloc>(
          create: (context) => RestaurantsBloc(
            GetData(
              repository: RestaurantReopimpl(
                datasource: DataFromApiForResraurent(),
              ),
            ),
          ),
        ),
        BlocProvider<PlacesBloc>(
          create: (context) => PlacesBloc(
            GetPlacesData(
              repository: PlacesReopimpl(datasource: DataFromPlacesApi()),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel India',
        theme: AppTheme.lightTheme,
        home: LoginPage(),
        // home: HomePage(userDetails: ,),
      ),
    );
  }
}
