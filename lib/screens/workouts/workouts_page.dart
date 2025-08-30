import 'package:fitness_tracker/screens/workouts/workout_list_page.dart';
import 'package:flutter/material.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});
  final List<Map<String, String>> categories = const [
    {'title': 'Cardio', 'description': 'Running, cycling, and more'},
    {'title': 'Resistance', 'description': 'Strength training workouts'},
    {'title': 'HIIT', 'description': 'High intensity interval training'},
    {'title': 'Flexibility', 'description': 'Stretching & yoga'},
    {'title': 'Core', 'description': 'Abdominal and core workouts'},
    {'title': 'Balance', 'description': 'Balance and stability exercises'},
    {'title': 'Mobility', 'description': 'Joint and movement improvement'},
    {'title': 'Sports', 'description': 'Sport-specific training routines'},
    {'title': 'Bodyweight', 'description': 'No equipment needed'},
    {'title': 'Recovery', 'description': 'Cool down and recovery routines'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Workout Categories")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            color: colors.primary, // Add your desired color here
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: ListTile(
              title: Text(
                category['title']!,
                style: TextStyle(color: colors.onPrimary),
              ),
              subtitle: Text(
                category['description']!,
                style: TextStyle(color: colors.onPrimary.withOpacity(0.8)),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: colors.onPrimary),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WorkoutListPage(
                      category: category['title']!,
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
