import 'dart:async';
import 'package:flutter/material.dart';

class ExerciseDetailPage extends StatefulWidget {
  final String exerciseName;
  final String duration; // initial suggested duration
  final String calories; // initial calories estimate

  const ExerciseDetailPage({
    super.key,
    required this.exerciseName,
    required this.duration,
    required this.calories,
  });

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  bool isRunning = false;
  int elapsedSeconds = 0;
  Timer? _timer;

  double caloriesBurned = 0;

  /// 🔹 Different calorie burn rates (calories per minute)
  double getCaloriesPerMinute(String exerciseName) {
    switch (exerciseName.toLowerCase()) {
      case "lifting":
        return 6.0; // Lifting burns ~6 cal/min
      case "cycling":
        return 10.0; // Cycling burns ~10 cal/min
      default:
        return 8.0; // Default if not listed
    }
  }

  void startSession() {
    setState(() {
      isRunning = true;
    });

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
    setState(() {
      isRunning = false;
    });
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
      appBar: AppBar(
        title: Text(widget.exerciseName),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Session: ${widget.exerciseName}",
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

              /// Show burn rate
              Text(
                "Burn rate: $burnRate cal/min",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 30),

              /// Start / Stop button
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
