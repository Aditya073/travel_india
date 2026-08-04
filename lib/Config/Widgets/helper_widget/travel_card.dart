import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/state_page/presentation/pages/state_page.dart';

class TravelCard extends StatelessWidget {
  final String? stateName;
  final String? image;
  final String? description;
  final double? rating;

  const TravelCard({
    super.key,
    required this.stateName,
    required this.image,
    required this.description,
    this.rating,
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (stateName != null) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          stateName!.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.08,
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ],
                ),
                if (rating != null)
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 16,
                        color: Colors.amber.shade600,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        rating!.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.amber.shade700,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),

          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Stack(
              children: [
                Image.network(
                  image!,
                  height: 210,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Gradient overlay
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

                // Content over image
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Description
                        Text(
                          description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.5,
                            color: Colors.white.withOpacity(0.80),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Buttons row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  // Bookmark
                                  _IconBtn(icon: Icons.bookmark_border_rounded),
                                  Spacer(),

                                  // Explore
                                  FilledButton.icon(
                                    onPressed: () {
                                      // navigate to that state

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => StatePage(stateName: stateName!,),
                                        ),
                                      );
                                    },
                                    style: FilledButton.styleFrom(
                                      backgroundColor: colorScheme.primary,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 9,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      textStyle: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 15,
                                    ),
                                    iconAlignment: IconAlignment.end,
                                    label: const Text('Explore'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class _ChipStat extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const _ChipStat({required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(icon, size: 13, color: Colors.white60),
//         const SizedBox(width: 4),
//         Text(
//           label,
//           style: const TextStyle(fontSize: 12, color: Colors.white60),
//         ),
//       ],
//     );
//   }
// }

class _IconBtn extends StatelessWidget {
  final IconData icon;

  const _IconBtn({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        border: Border.all(color: Colors.white.withOpacity(0.22), width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 17, color: Colors.white70),
    );
  }
}
