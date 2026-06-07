import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';

class MapCard extends StatelessWidget {
  const MapCard({super.key});

  @override
  Widget build(BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;

    return Container(

      width: 340,
      decoration: BoxDecoration(
        color: colorScheme.surface,

        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.powderBlue,
          width: 2,
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.08),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          
        ],
      ),
    
    );
  }
}