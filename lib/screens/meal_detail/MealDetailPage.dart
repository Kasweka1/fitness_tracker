// lib/pages/meal_detail_page.dart
import 'package:flutter/material.dart';
import '../../services/models/meal.dart';

class MealDetailPage extends StatelessWidget {
  final Meal meal;

  const MealDetailPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(meal.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            Text("Calories: ${meal.calories} kcal"),
            const SizedBox(height: 12),
            const Text("Ingredients:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            ...meal.ingredients.map((i) => Text("- $i")),
            const SizedBox(height: 12),
            const Text("Steps:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...meal.steps.map((s) => Text("• $s")),
          ],
        ),
      ),
    );
  }
}
