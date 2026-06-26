import 'package:flutter/material.dart';

class AirportPages extends StatefulWidget {
  const AirportPages({super.key});

  @override
  State<AirportPages> createState() => _AirportPagesState();
}

class _AirportPagesState extends State<AirportPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Airports"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}