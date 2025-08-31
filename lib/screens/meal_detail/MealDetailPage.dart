import 'package:flutter/material.dart';
import 'package:fitness_tracker/screens/home_tabs/diet_tab.dart';
import 'package:fitness_tracker/services/models/meal.dart';
import 'package:fitness_tracker/services/db/db_helper.dart';

class DietTab extends StatefulWidget {
  const DietTab({super.key});

  @override
  State<DietTab> createState() => _DietTabState();
}

class _DietTabState extends State<DietTab> {
  @override
  Widget build(BuildContext context) {
    // You can implement your DietTab UI here or leave it empty if not needed
    return Container();
  }
}

class MealDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final double calories;
  final double protein;
  final double fat;
  final Map<String, double> nutrition;
  final List<String> ingredients;
  final List<String> steps;

  const MealDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.nutrition,
    required this.ingredients,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(description,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text("Calories: ${calories.toStringAsFixed(0)} kcal"),
          Text("Protein: ${protein} g"),
          Text("Fat: ${fat} g"),
          const Divider(),
          const Text("Ingredients",
              style: TextStyle(fontWeight: FontWeight.bold)),
          ...ingredients.map((e) => Text("• $e")),
          const Divider(),
          const Text("Steps", style: TextStyle(fontWeight: FontWeight.bold)),
          ...steps.map((e) => Text("- $e")),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final dbMeal = Meal(
                title: title,
                description: description,
                calories: calories,
                carbs: nutrition['Carbs'] ?? 0,
                protein: protein,
                fat: fat,
                date: DateTime.now().toIso8601String().substring(0, 10),
              );

              await DatabaseHelper.instance.insertMeal(dbMeal);
              Navigator.pop(context, true); // return true to refresh
            },
            child: const Text("Mark as Eaten"),
          )
        ],
      ),
    );
  }
}
