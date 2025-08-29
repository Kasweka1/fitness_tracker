import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  final String foodName;
  final String calories;
  final String serving;
  final String title;
  final List<String> ingredients;
  final List<String> steps;

  const FoodDetailPage({
    super.key,
    required this.foodName,
    required this.calories,
    required this.serving,
    required this.title,
    required this.ingredients,
    required this.steps,
  }); // ✅ Add const constructor with required fields

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              title.isEmpty ? foodName : title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Calories: $calories"),
            Text("Serving: $serving"),
            const SizedBox(height: 20),
            const Text("Ingredients:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...ingredients.map((ing) => Text("- $ing")).toList(),
            const SizedBox(height: 20),
            const Text("Steps:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...steps.map((step) => Text("• $step")).toList(),
          ],
        ),
      ),
    );
  }
}
