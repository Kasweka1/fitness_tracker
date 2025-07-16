import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseCard extends StatelessWidget {
  final String exerciseName;
  final String duration;
  final String calories;
  final String svgAsset;
  final VoidCallback onSeeAll;

  const ExerciseCard({
    Key? key,
    required this.exerciseName,
    required this.duration,
    required this.calories,
    required this.svgAsset,
    required this.onSeeAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Left Section: Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exerciseName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '$duration • $calories',
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.onPrimaryContainer.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton.icon(
                  onPressed: onSeeAll,
                  style: FilledButton.styleFrom(
                    backgroundColor: colors.secondary,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.play_arrow,
                      size: 18, color: Colors.white),
                  label: const Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Right Section: SVG
          SvgPicture.asset(
            svgAsset,
            height: 60,
            width: 60,
          ),
        ],
      ),
    );
  }
}
