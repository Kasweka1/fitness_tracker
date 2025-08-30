import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final String name;
  final String category;

  const WorkoutDetailsPage({
    super.key,
    required this.name,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Category: $category",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Workout: $name",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("Description:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            const Text(
              "This is where you can add workout instructions, benefits, or steps.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
