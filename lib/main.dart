
import 'package:fitness_tracker/core/theme/theme.dart';
import 'package:fitness_tracker/core/theme/util.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/screens/home.dart';

void main() {
  runApp(const MyFitnessTracker());
}

class MyFitnessTracker extends StatelessWidget {
  const MyFitnessTracker({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
