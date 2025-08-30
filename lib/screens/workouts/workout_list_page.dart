import 'package:fitness_tracker/screens/workouts/exercise_detail_page.dart';
import 'package:fitness_tracker/screens/workouts/workout_detail_page.dart';
import 'package:flutter/material.dart';

class WorkoutListPage extends StatelessWidget {
  final String category;
  const WorkoutListPage({super.key, required this.category});

  // mock data for now
  final Map<String, List<String>> workouts = const {
    'Cardio': ['Running', 'Cycling', 'Jump Rope'],
    'Resistance': ['Push Ups', 'Deadlifts', 'Squats'],
    'HIIT': ['Burpees', 'Mountain Climbers', 'Sprints'],
    'Flexibility': ['Yoga Flow', 'Hamstring Stretch', 'Back Stretch'],
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final items = workouts[category] ?? [];
    return Scaffold(
      appBar: AppBar(title: Text("$category Workouts")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final workout = items[index];
          return Card(
            color: colors.secondary, // Set card background color
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(
                workout,
                style: TextStyle(
                  color: colors.onSecondary, // Set text color
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.fitness_center, color: colors.onSecondary),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExerciseDetailPage(
                      exerciseName: workout,
                      category: category,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
