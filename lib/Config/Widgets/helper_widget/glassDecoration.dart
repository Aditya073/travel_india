import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';

class GlassDecoButton extends StatelessWidget {
  const GlassDecoButton({super.key, required this.text});

  final String text;
  // final dynamic color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(15),
        minimumSize: Size(double.minPositive, 15),
        backgroundColor: AppTheme.darkColor.withOpacity(0.3),
        textStyle: TextStyle(fontSize: 20),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
      ),
    );
  }
}
