import 'package:flutter/material.dart';
import '../services/db/db_helper.dart';
import '../services/models/meal.dart';
import '../services/models/workout.dart';

class DailyActivityPage extends StatefulWidget {
  const DailyActivityPage({super.key});

  @override
  State<DailyActivityPage> createState() => _DailyActivityPageState();
}

class _DailyActivityPageState extends State<DailyActivityPage> {
  double totalCalories = 0;
  double totalCarbs = 0;
  double totalProtein = 0;
  double totalFat = 0;
  double totalCaloriesBurned = 0;

  @override
  void initState() {
    super.initState();
    _loadDailyStats();
  }

  Future<void> _loadDailyStats() async {
    final db = DatabaseHelper.instance;
    final today = DateTime.now().toIso8601String().split("T").first;

    final meals = await db.fetchMealsByDate(today);
    final workouts = await db.fetchWorkoutsByDate(today);

    double cal = 0, carbs = 0, protein = 0, fat = 0, burned = 0;

    for (Meal m in meals) {
      cal += m.calories;
      carbs += m.carbs;
      protein += m.protein;
      fat += m.fat;
    }

    for (Workout w in workouts) {
      burned += w.caloriesBurned;
    }

    setState(() {
      totalCalories = cal;
      totalCarbs = carbs;
      totalProtein = protein;
      totalFat = fat;
      totalCaloriesBurned = burned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daily Activity")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Calories Consumed: $totalCalories cal",
                style: const TextStyle(fontSize: 20)),
            Text("Protein: $totalProtein g"),
            Text("Carbs: $totalCarbs g"),
            Text("Fat: $totalFat g"),
            const Divider(),
            Text("Calories Burned: $totalCaloriesBurned cal",
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
