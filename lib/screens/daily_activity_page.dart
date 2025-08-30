import 'package:flutter/material.dart';
import 'package:fitness_tracker/services/db/db_helper.dart';
import 'package:fitness_tracker/services/models/meal.dart';
import 'package:fitness_tracker/services/models/workout.dart';

class DailyActivityPage extends StatefulWidget {
  const DailyActivityPage({super.key});

  @override
  State<DailyActivityPage> createState() => _DailyActivityPageState();
}

class _DailyActivityPageState extends State<DailyActivityPage> {
  // Nutritional stats
  double totalCalories = 0;
  double totalCarbs = 0;
  double totalProtein = 0;
  double totalFat = 0;

  // Activity stats
  double totalCaloriesBurned = 0;
  List<Workout> workoutsToday = [];

  // Mocked daily activities
  double stepsTaken = 7500;
  double stepGoal = 10000;
  double waterIntake = 1.5; // liters
  double waterGoal = 2.5;
  double sleepHours = 6.5;
  double sleepGoal = 8;
  String mood = "Energetic";

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
      workoutsToday = workouts;
    });
  }

  Widget _buildProgressCard(String title, double current, double goal, Color color, {String unit = ""}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: (current / goal).clamp(0.0, 1.0),
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              color: color,
            ),
            const SizedBox(height: 8),
            Text("${current.toStringAsFixed(1)} / ${goal.toStringAsFixed(1)} $unit")
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutList() {
    if (workoutsToday.isEmpty) {
      return const Text("No workouts logged today");
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: workoutsToday.length,
      itemBuilder: (context, index) {
        final w = workoutsToday[index];
        return ListTile(
          leading: const Icon(Icons.fitness_center),
          title: Text(w.name),
          subtitle: Text("${(w.duration / 60).toStringAsFixed(0)} min | ${w.caloriesBurned.toStringAsFixed(1)} cal"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daily Activity")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nutritional stats
            const Text("Nutrition", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildProgressCard("Calories Consumed", totalCalories, 2000, Colors.orange, unit: "cal"),
            _buildProgressCard("Protein", totalProtein, 100, Colors.green, unit: "g"),
            _buildProgressCard("Carbs", totalCarbs, 300, Colors.blue, unit: "g"),
            _buildProgressCard("Fat", totalFat, 70, Colors.red, unit: "g"),
            const SizedBox(height: 16),

            // Calories burned
            _buildProgressCard("Calories Burned", totalCaloriesBurned, 500, Colors.purple, unit: "cal"),
            const SizedBox(height: 16),

            // Workouts
            const Text("Today's Workouts", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildWorkoutList(),
            const SizedBox(height: 16),

            // Steps
            _buildProgressCard("Steps", stepsTaken, stepGoal, Colors.teal, unit: "steps"),

            // Water
            _buildProgressCard("Water Intake", waterIntake, waterGoal, Colors.blue, unit: "L"),

            // Sleep
            _buildProgressCard("Sleep", sleepHours, sleepGoal, Colors.deepPurple, unit: "h"),

            const SizedBox(height: 16),
            Text("Mood: $mood", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
