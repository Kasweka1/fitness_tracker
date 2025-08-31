import 'package:flutter/material.dart';
import 'package:fitness_tracker/screens/meal_detail/MealDetailPage.dart';
import 'package:fitness_tracker/services/models/meal.dart';
import 'package:fitness_tracker/services/db/db_helper.dart';

class DietTab extends StatefulWidget {
  const DietTab({super.key});

  @override
  State<DietTab> createState() => _DietTabState();
}

class _DietTabState extends State<DietTab> {
  List<Meal> meals = [];

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  Future<void> _loadMeals() async {
    final dbMeals = await DatabaseHelper.instance.getMeals();
    setState(() {
      meals = dbMeals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Diet Plan")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _MealCard(
            title: 'Breakfast',
            description: 'Oatmeal with fruits',
            calories: 320,
            icon: Icons.free_breakfast,
            color: Colors.orange[100]!,
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MealDetailPage(
                    title: 'Breakfast',
                    description: 'Oatmeal with fruits',
                    calories: 320,
                    protein: 10,
                    fat: 5,
                    nutrition: {
                      'Carbs': 55,
                      'Protein': 10,
                      'Fat': 5,
                    },
                    ingredients: [
                      '1 cup oats',
                      '1 banana',
                      '1 tbsp honey',
                      '1/2 cup berries',
                    ],
                    steps: [
                      'Boil 1 cup water or milk.',
                      'Add oats and cook for 5 minutes.',
                      'Top with banana slices and berries.',
                      'Drizzle honey before serving.',
                    ],
                  ),
                ),
              );
              if (result == true) _loadMeals();
            },
          ),
          _MealCard(
            title: 'Lunch',
            description: 'Grilled chicken with rice',
            calories: 540,
            icon: Icons.lunch_dining,
            color: Colors.green[100]!,
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MealDetailPage(
                    title: 'Lunch',
                    description: 'Grilled chicken with rice',
                    calories: 540,
                    protein: 45,
                    fat: 15,
                    nutrition: {
                      'Carbs': 20,
                      'Protein': 45,
                      'Fat': 15,
                    },
                    ingredients: [
                      '200g chicken breast',
                      '1 cup rice',
                      '1 cup steamed vegetables',
                    ],
                    steps: [
                      'Grill chicken until fully cooked.',
                      'Cook rice and steam vegetables.',
                      'Serve chicken with rice and vegetables.',
                    ],
                  ),
                ),
              );
              if (result == true) _loadMeals();
            },
          ),
          _MealCard(
            title: 'Dinner',
            description: 'Salmon with quinoa',
            calories: 450,
            icon: Icons.dinner_dining,
            color: Colors.blue[100]!,
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MealDetailPage(
                    title: 'Dinner',
                    description: 'Salmon with quinoa',
                    calories: 450,
                    protein: 18,
                    fat: 8,
                    nutrition: {
                      'Carbs': 70,
                      'Protein': 18,
                      'Fat': 8,
                    },
                    ingredients: [
                      '200g salmon',
                      '1 cup quinoa',
                      '1 cup spinach',
                    ],
                    steps: [
                      'Bake salmon until golden.',
                      'Cook quinoa until fluffy.',
                      'Sauté spinach lightly.',
                      'Serve together.',
                    ],
                  ),
                ),
              );
              if (result == true) _loadMeals();
            },
          ),
          _MealCard(
            title: 'Snack',
            description: 'Protein smoothie',
            calories: 200,
            icon: Icons.local_drink,
            color: Colors.purple[100]!,
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MealDetailPage(
                    title: 'Snack',
                    description: 'Protein smoothie',
                    calories: 200,
                    protein: 12,
                    fat: 10,
                    nutrition: {
                      'Carbs': 15,
                      'Protein': 12,
                      'Fat': 10,
                    },
                    ingredients: [
                      '1 scoop protein powder',
                      '1 cup milk',
                      '1 banana',
                    ],
                    steps: [
                      'Add all ingredients to blender.',
                      'Blend until smooth.',
                      'Pour into glass and serve.',
                    ],
                  ),
                ),
              );
              if (result == true) _loadMeals();
            },
          ),
        ],
      ),
    );
  }
}

class _MealCard extends StatelessWidget {
  final String title;
  final String description;
  final double calories;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _MealCard({
    required this.title,
    required this.description,
    required this.calories,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
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
                      style:
                          const TextStyle(fontSize: 13, color: Colors.black54)),
                ],
              ),
            ),
            Text("${calories.toStringAsFixed(0)} kcal",
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
