import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/Config/Widgets/travel_card.dart';
import 'package:travel_india/features/home_page/presentation/bloc/card_bloc.dart';

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
  void initState() {
    super.initState();
    context.read<CardBloc>().add(GetCardData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CardBloc, CardState>(
      listener: (context, state) {
        if (state is CardLoading) {
          Center(child: CircularProgressIndicator(color: Colors.black));
        }

        if (state is Success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text(
                  'Login Successful',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              ),
              backgroundColor: Colors.white.withOpacity(0.2),
            ),
          );
        }

        if (state is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Center(
                child: Text(
                  'Something went wrong',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
              backgroundColor: Colors.white.withOpacity(0.2),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          // **************** App name ****************************************888888
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            onPressed: () {
              // sliding profile window
              // 1. display username
              // 2. shows the states that have been book marked / saved
              // 3. add logout feature here ---> and a checkbox to conform it
            },
            icon: Icon(Icons.person, size: 35, color: AppTheme.iceBlue),
          ),

          actions: [
            IconButton(
              onPressed: () {
                // sliding settings window
                // 1. change to a dark/light theme
              },
              icon: Icon(
                Icons.more_vert_outlined,
                size: 30,
                color: AppTheme.iceBlue,
              ),
            ),
          ],
        ),

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
                    borderRadius: BorderRadius.circular(16),

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
                      // this should show the only results that is being typed
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: "Search Destination",
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
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
                    children: [
                      BlocBuilder<CardBloc, CardState>(
                        builder: (context, state) {
                          if (state is CardLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is Failure) {
                            return Center(
                              child: Text(
                                state.message,
                                style: TextStyle(fontSize: 24),
                              ),
                            );
                          }
                          if (state is Success) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.card.length,
                              itemBuilder: (context, index) {
                                final card = state.card[index];

                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 25,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: TravelCard(
                                    stateName: card.stateName,
                                    image: card.imageUrl,
                                    description: card.description,
                                  ),
                                );
                              },
                            );
                          }
                          return const Center(
                            child: Text("Something went wrong"),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
