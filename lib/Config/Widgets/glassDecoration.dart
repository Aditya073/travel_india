import 'package:flutter/material.dart';

class GlassDecoration extends StatelessWidget {
  const GlassDecoration({super.key, required this.text});

  final String text;
  // final dynamic color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(15),
        minimumSize: Size(double.minPositive, 15),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
        textStyle: TextStyle(fontSize: 20),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
      ),
    );
  }
}