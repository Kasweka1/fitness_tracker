import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodCard extends StatelessWidget {
  final String foodName;
  final String calories;
  final String serving;
  final String svgAsset;
  final VoidCallback onStart;

  const FoodCard({
    super.key,
    required this.foodName,
    required this.calories,
    required this.serving,
    required this.svgAsset,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left: SVG Image
          SvgPicture.asset(
            svgAsset,
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 12),
          // Middle: Text & Button
          Expanded(
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // <-- this line fixes the overflow
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '$calories • $serving',
                  style: TextStyle(
                    fontSize: 13,
                    color: colors.onPrimaryContainer.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
