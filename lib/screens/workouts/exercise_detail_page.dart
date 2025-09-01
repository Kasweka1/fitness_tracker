import 'dart:async';
import 'package:fitness_tracker/services/db/db_helper.dart';
import 'package:fitness_tracker/services/models/workout.dart';
import 'package:flutter/material.dart';

class ExerciseDetailPage extends StatefulWidget {
  final String exerciseName;
  final String category;

  const ExerciseDetailPage({
    super.key,
    required this.exerciseName,
    required this.category,
  });

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  bool isRunning = false;
  int elapsedSeconds = 0;
  Timer? _timer;

  double caloriesBurned = 0;

  /// Calories burned per minute based on exercise type
  double getCaloriesPerMinute(String exerciseName) {
    switch (exerciseName.toLowerCase()) {
      case "running":
        return 12.0;
      case "cycling":
        return 10.0;
      case "push ups":
        return 8.0;
      default:
        return 6.0; // default
    }
  }

  void startSession() {
    setState(() => isRunning = true);

    final burnRate = getCaloriesPerMinute(widget.exerciseName);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        elapsedSeconds++;
        caloriesBurned = (elapsedSeconds / 60) * burnRate;
      });
    });
  }

  void stopSession() {
    _timer?.cancel();
    setState(() => isRunning = false);

    // Save workout to DB
    final workout = Workout(
      name: widget.exerciseName,
      type: widget.category,
      duration: elapsedSeconds,
      caloriesBurned: caloriesBurned,
      date: DateTime.now().toIso8601String(),
      id: null,
    );

    DatabaseHelper.instance.insertWorkout(workout);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Workout saved successfully!')),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    final burnRate = getCaloriesPerMinute(widget.exerciseName);

    return Scaffold(
      appBar: AppBar(title: Text(widget.exerciseName)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.exerciseName,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              /// Timer
              Text(
                formatTime(elapsedSeconds),
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              /// Calories burned
              Text(
                "Calories burned: ${caloriesBurned.toStringAsFixed(1)} cal",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),

              /// Burn rate
              Text(
                "Burn rate: $burnRate cal/min",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              /// Start / Stop
              ElevatedButton.icon(
                onPressed: isRunning ? stopSession : startSession,
                icon: Icon(isRunning ? Icons.stop : Icons.play_arrow),
                label: Text(isRunning ? "Stop Session" : "Start Session"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
