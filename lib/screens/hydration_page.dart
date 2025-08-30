import 'package:flutter/material.dart';

class HydrationPage extends StatefulWidget {
  const HydrationPage({super.key});

  @override
  State<HydrationPage> createState() => _HydrationPageState();
}

class _HydrationPageState extends State<HydrationPage> {
  double waterIntake = 1.5; // liters, initial/mock value
  double waterGoal = 2.5;   // daily goal in liters
  double glassSize = 0.25;  // 1 glass = 250ml

  void _addGlass() {
    setState(() {
      waterIntake += glassSize;
      if (waterIntake > waterGoal) waterIntake = waterGoal;
    });
  }

  void _removeGlass() {
    setState(() {
      waterIntake -= glassSize;
      if (waterIntake < 0) waterIntake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final progress = (waterIntake / waterGoal).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(title: const Text("Hydration Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "Daily Water Intake",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 20,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 8),
                    Text("${waterIntake.toStringAsFixed(2)} / $waterGoal L",
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _removeGlass,
                          icon: const Icon(Icons.remove),
                          label: const Text("Remove Glass"),
                          style: ElevatedButton.styleFrom(minimumSize: const Size(140, 40)),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed: _addGlass,
                          icon: const Icon(Icons.local_drink),
                          label: const Text("Add Glass"),
                          style: ElevatedButton.styleFrom(minimumSize: const Size(140, 40)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            // Optional: mock weekly summary
            const Text(
              "Past Days (mocked)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...List.generate(5, (index) {
              final mockIntake = 1.0 + index * 0.2; // mock values
              final mockProgress = (mockIntake / waterGoal).clamp(0.0, 1.0);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Day ${index + 1}"),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: mockProgress,
                      minHeight: 12,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue,
                    ),
                    Text("${mockIntake.toStringAsFixed(1)} / $waterGoal L"),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
