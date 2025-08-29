// lib/widgets/nutrition_chart.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class NutritionChart extends StatelessWidget {
  final Map<String, double> nutrition;

  const NutritionChart({super.key, required this.nutrition});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: nutrition.entries.map((entry) {
            return PieChartSectionData(
              value: entry.value,
              title: entry.key,
              titleStyle: const TextStyle(color: Colors.white, fontSize: 12),
            );
          }).toList(),
        ),
      ),
    );
  }
}
