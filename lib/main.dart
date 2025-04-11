import 'package:fitness_tracker/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/screens/home.dart';

void main() {
  runApp(const MyFitnessTracker());
}

class MyFitnessTracker extends StatelessWidget {
  const MyFitnessTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.secondaryBlue,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
      titleLarge: AppTextStyles.topHeading,
        )
      ),
      home: HomePage(),
    );
  }
}