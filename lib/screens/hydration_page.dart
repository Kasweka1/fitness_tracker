import 'package:flutter/material.dart';

class HydrationPage extends StatelessWidget {
  const HydrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hydration")),
      body: const Center(
        child: Text(
          "Track your water intake (glasses per day).",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
