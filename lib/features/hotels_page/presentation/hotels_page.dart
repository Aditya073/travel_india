import 'package:flutter/material.dart';

class HotelsPage extends StatelessWidget {
  final String stateName;
  const HotelsPage({super.key, required this.stateName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 55,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(12),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],~
              ),

              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: const TextField(
                  // this should show the only results that is being typed
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: "Search Hotels",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),

          // hotels cards
          
          
        ],
      ),
    );
  }
}






              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         BlocBuilder<hotelsBloc, hotelsState>(
              //           builder: (context, state) {
              //             if (state is CardLoading) {
              //               return const Center(
              //                 child: CircularProgressIndicator(),
              //               );
              //             }
              //             if (state is Failure) {
              //               return Center(
              //                 child: Text(
              //                   state.message,
              //                   style: TextStyle(fontSize: 24),
              //                 ),
              //               );
              //             }
              //             if (state is Success) {
              //               return ListView.builder(
              //                 shrinkWrap: true,
              //                 physics: NeverScrollableScrollPhysics(),
              //                 itemCount: state.card.length,
              //                 itemBuilder: (context, index) {
              //                   final card = state.card[index];

              //                   return Padding(
              //                     padding: const EdgeInsets.only(
              //                       bottom: 25,
              //                       left: 20,
              //                       right: 20,
              //                     ),
              //                     child: TravelCard(
              //                       stateName: card.stateName,
              //                       image: card.imageUrl,
              //                       description: card.description,
              //                     ),
              //                   );
              //                 },
              //               );
              //             }
              //             return const Center(
              //               child: Text("Something went wrong"),
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),