import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';

class MapCard extends StatelessWidget {
  const MapCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: MediaQuery.sizeOf(context).width / 2,

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
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Google_logo.png',
            height: 210,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.2, 0.55, 0.8, 1.0],
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.72),
                    Colors.black.withOpacity(0.92),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('View', style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
