// lib/widgets/meal_card.dart
import 'package:flutter/material.dart';
import '../../../services/models/meal.dart';
import '../../meal_detail/MealDetailPage.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(meal.title),
        subtitle: Text("${meal.calories} kcal"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MealDetailPage(meal: meal),
            ),
          );
        },
      ),
    );
  }
}
