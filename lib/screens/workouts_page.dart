import 'package:flutter/material.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Workouts")),
      body: const Center(
        child: Text(
          "Log and track your weight lifting sessions.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
