import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fitness_tracker/services/db/db_helper.dart';
import 'package:fitness_tracker/services/models/meal.dart';

class DietTab extends StatefulWidget {
  const DietTab({super.key});

  @override
  State<DietTab> createState() => _DietTabState();
}

class _DietTabState extends State<DietTab> {
  double carbs = 0;
  double protein = 0;
  double fat = 0;

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  Future<void> _loadMeals() async {
    final today = DateTime.now().toIso8601String().substring(0, 10);
    final meals = await DatabaseHelper.instance.fetchMealsByDate(today);

    double totalCarbs = 0, totalProtein = 0, totalFat = 0;
    for (var m in meals) {
      totalCarbs += m.carbs;
      totalProtein += m.protein;
      totalFat += m.fat;
    }

    setState(() {
      carbs = totalCarbs;
      protein = totalProtein;
      fat = totalFat;
    });
  }

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

          // Breakfast
          _MealCard(
            title: 'Breakfast',
            description: 'Oatmeal with fruits',
            calories: '320 kcal',
            icon: Icons.free_breakfast,
            color: Colors.orange[100]!,
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MealDetailPage(
                    title: 'Breakfast',
                    description: 'Oatmeal with fruits',
                    calories: '320 kcal',
                    ingredients: [
                      '1 cup oats',
                      '1 banana',
                      '1 tbsp honey',
                      '1/2 cup berries',
                    ],
                    nutrition: {
                      'Carbs': '55g',
                      'Protein': '10g',
                      'Fat': '5g',
                    },
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

          // Lunch
          _MealCard(
            title: 'Lunch',
            description: 'Grilled chicken & veggies',
            calories: '540 kcal',
            icon: Icons.lunch_dining,
            color: Colors.green[100]!,
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MealDetailPage(
                    title: 'Lunch',
                    description: 'Grilled chicken & veggies',
                    calories: '540 kcal',
                    ingredients: [
                      '200g chicken breast',
                      '1 cup broccoli',
                      '1/2 cup carrots',
                      '1 tbsp olive oil',
                      'Salt, pepper, paprika',
                    ],
                    nutrition: {
                      'Carbs': '20g',
                      'Protein': '45g',
                      'Fat': '15g',
                    },
                    steps: [
                      'Season chicken with spices listed down.',
                      'Grill chicken until fully cooked.',
                      'Steam or roast the veggies.',
                      'Serve together with olive oil drizzle.',
                    ],
                  ),
                ),
              );

              if (result == true) _loadMeals();
            },
          ),

          // Dinner
          _MealCard(
            title: 'Dinner',
            description: 'Rice & beans',
            calories: '450 kcal',
            icon: Icons.dinner_dining,
            color: Colors.blue[100]!,
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MealDetailPage(
                    title: 'Dinner',
                    description: 'Rice & beans',
                    calories: '450 kcal',
                    ingredients: [
                      '1 cup rice',
                      '1 cup beans (cooked)',
                      '1 onion',
                      '1 tomato',
                      'Spices (garlic, cumin, salt)',
                    ],
                    nutrition: {
                      'Carbs': '70g',
                      'Protein': '18g',
                      'Fat': '8g',
                    },
                    steps: [
                      'Cook rice until fluffy.',
                      'Sauté onion and tomato with spices.',
                      'Add cooked beans and simmer for 10 mins.',
                      'Serve beans over rice.',
                    ],
                  ),
                ),
              );

              if (result == true) _loadMeals();
            },
          ),

          // Snacks
          _MealCard(
            title: 'Snacks',
            description: 'Yogurt & nuts',
            calories: '200 kcal',
            icon: Icons.emoji_food_beverage,
            color: Colors.purple[100]!,
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MealDetailPage(
                    title: 'Snacks',
                    description: 'Yogurt & nuts',
                    calories: '200 kcal',
                    ingredients: [
                      '1 cup plain yogurt',
                      'Handful of almonds',
                      'Handful of walnuts',
                      '1 tsp honey',
                    ],
                    nutrition: {
                      'Carbs': '15g',
                      'Protein': '12g',
                      'Fat': '10g',
                    },
                    steps: [
                      'Scoop yogurt into a bowl.',
                      'Top with almonds and walnuts.',
                      'Drizzle honey on top.',
                      'Enjoy as a quick snack!',
                    ],
                  ),
                ),
              );

              if (result == true) _loadMeals();
            },
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
                    value: carbs,
                    title: 'Carbs',
                    titleStyle:
                        const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  PieChartSectionData(
                    color: Colors.blue,
                    value: protein,
                    title: 'Protein',
                    titleStyle:
                        const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  PieChartSectionData(
                    color: Colors.green,
                    value: fat,
                    title: 'Fat',
                    titleStyle:
                        const TextStyle(fontSize: 12, color: Colors.white),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
            Text(calories, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class MealDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String calories;
  final List<String> ingredients;
  final Map<String, String> nutrition;
  final List<String> steps;

  const MealDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.calories,
    required this.ingredients,
    required this.nutrition,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: colors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description,
                  style: const TextStyle(fontSize: 16, color: Colors.black87)),
              const SizedBox(height: 12),
              Text('Calories: $calories',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colors.primary)),
              const SizedBox(height: 24),
              Text("Ingredients",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 8),
              ...ingredients.map((item) => Text("• $item")),
              const SizedBox(height: 24),
              Text("Nutritional Stats",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 8),
              ...nutrition.entries.map((e) => Text("${e.key}: ${e.value}")),
              const SizedBox(height: 24),
              Text("Preparation Steps",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 8),
              ...steps
                  .asMap()
                  .entries
                  .map((e) => Text("${e.key + 1}. ${e.value}")),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final dbMeal = Meal(
                      title: title,
                      description: description,
                      calories: double.tryParse(
                              calories.replaceAll(RegExp(r'[^0-9.]'), '')) ??
                          0,
                      carbs: double.tryParse(
                              nutrition['Carbs']?.replaceAll('g', '') ?? '0') ??
                          0,
                      proteins: double.tryParse(
                              nutrition['Protein']?.replaceAll('g', '') ??
                                  '0') ??
                          0,
                      fats: double.tryParse(
                              nutrition['Fat']?.replaceAll('g', '') ?? '0') ??
                          0,
                      date: DateTime.now().toIso8601String().substring(0, 10),
                      ingredients: [],
                      nutrition: {},
                      steps: [],
                      name: '',
                      protein: 0,
                      fat: 0,
                    );

                    await DatabaseHelper.instance.insertMeal(dbMeal);
                    Navigator.pop(context, true); // refresh DietTab
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Mark as Eaten"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
