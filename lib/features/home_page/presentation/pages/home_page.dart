import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/Config/Widgets/travel_card.dart';
import 'package:travel_india/features/auth/data/models/user_model.dart';
import 'package:travel_india/features/home_page/presentation/bloc/card_bloc.dart';
import 'package:travel_india/features/home_page/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  final UserModel userDetails;
  const HomePage({super.key, required this.userDetails});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        drawer: Drawer(
          backgroundColor: AppTheme.powderBlue,
          child: SafeArea(
            child: Column(
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    color: AppTheme.darkColor.withOpacity(0.08),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 45,
                          color: AppTheme.darkColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.userDetails.userName!,
                        style: TextStyle(
                          color: AppTheme.darkColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Menu Items
                ListTile(
                  leading: Icon(
                    Icons.person_outline,
                    color: AppTheme.darkColor,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      color: AppTheme.darkColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppTheme.darkColor,
                  ),
                  onTap: () {
                    // **************** profile page ****************
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(userDetails: widget.userDetails),
                      ),
                    );
                  },
                ),

                ListTile(
                  leading: Icon(
                    Icons.favorite_outline,
                    color: AppTheme.darkColor,
                  ),
                  title: Text(
                    "Saved",
                    style: TextStyle(
                      color: AppTheme.darkColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppTheme.darkColor,
                  ),
                  onTap: () {
                       // **************** Saved page ****************
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         // ProfilePage(userDetails: widget.userDetails),
                    //   ),
                    // );
                  },
                ),

                ListTile(
                  leading: Icon(
                    Icons.settings_outlined,
                    color: AppTheme.darkColor,
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                      color: AppTheme.darkColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppTheme.darkColor,
                  ),
                  onTap: () {
                       // **************** Setting page ****************
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         // ProfilePage(userDetails: widget.userDetails),
                    //   ),
                    // );
                  },
                ),

                const Spacer(),

                Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.logout_rounded,
                      color: Colors.red.shade400,
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.red.shade400,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      // call logout function and Navigator.pop()
                    },
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,

          title: Text(
            'Travel India',
            style: TextStyle(
              color: AppTheme.iceBlue,
              fontStyle: FontStyle.italic,
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),

          centerTitle: true,
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
