import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DietTab extends StatelessWidget {
  const DietTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Today\'s Meals',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colors.primary,
            ),
          ),
          const SizedBox(height: 12),

          // Meal Cards
          _MealCard(
            title: 'Breakfast',
            description: 'Oatmeal with fruits',
            calories: '320 kcal',
            icon: Icons.free_breakfast,
            color: Colors.orange[100]!,
          ),
          _MealCard(
            title: 'Lunch',
            description: 'Grilled chicken & veggies',
            calories: '540 kcal',
            icon: Icons.lunch_dining,
            color: Colors.green[100]!,
          ),
          _MealCard(
            title: 'Dinner',
            description: 'Rice & beans',
            calories: '450 kcal',
            icon: Icons.dinner_dining,
            color: Colors.blue[100]!,
          ),
          _MealCard(
            title: 'Snacks',
            description: 'Yogurt & nuts',
            calories: '200 kcal',
            icon: Icons.emoji_food_beverage,
            color: Colors.purple[100]!,
          ),
          const SizedBox(height: 24),

          // Nutrition Summary
          Text(
            'Nutrition Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colors.primary,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: Colors.red,
                    value: 40,
                    title: 'Carbs',
                    titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  PieChartSectionData(
                    color: Colors.blue,
                    value: 30,
                    title: 'Protein',
                    titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  PieChartSectionData(
                    color: Colors.green,
                    value: 30,
                    title: 'Fat',
                    titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          Center(
            child: FilledButton.icon(
              onPressed: () {
                // TODO: Implement Add Meal logic
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Meal'),
              style: FilledButton.styleFrom(
                backgroundColor: colors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MealCard extends StatelessWidget {
  final String title;
  final String description;
  final String calories;
  final IconData icon;
  final Color color;

  const _MealCard({
    required this.title,
    required this.description,
    required this.calories,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: colors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Text(description,
                    style: const TextStyle(fontSize: 13, color: Colors.black54)),
              ],
            ),
          ),
          Text(calories,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
