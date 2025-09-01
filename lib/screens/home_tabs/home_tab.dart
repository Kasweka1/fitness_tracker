import 'package:fitness_tracker/screens/meal_detail/MealDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// Screens
import 'package:fitness_tracker/screens/daily_activity_page.dart';
import 'package:fitness_tracker/screens/workouts/workouts_page.dart';
import 'package:fitness_tracker/screens/hydration_page.dart';
import 'package:fitness_tracker/screens/workouts/exercise_detail_page.dart';

// Widgets
import '../widgets/home/exercice_card.dart';
import '../widgets/home/fitnessCard.dart';
import '../widgets/home/food_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ---- Fitness Cards ----
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FitnessCard(
                  title: 'Daily Activity',
                  subtitle: 'Sprint jogs',
                  icon: LineAwesomeIcons.running_solid,
                  backgroundColor: colors.primary,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const DailyActivityPage()),
                    );
                  },
                ),
                FitnessCard(
                  title: 'Workouts',
                  subtitle: 'Lifting weights',
                  icon: LineAwesomeIcons.dumbbell_solid,
                  backgroundColor: colors.error,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const WorkoutsPage()),
                    );
                  },
                ),
                FitnessCard(
                  title: 'Hydration',
                  subtitle: '8 glasses today?',
                  icon: LineAwesomeIcons.water_solid,
                  backgroundColor: Colors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HydrationPage()),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// ---- Exercise Cards ----
          ExerciseCard(
            exerciseName: 'Lifting',
            duration: '15 mins',
            calories: '120 cal',
            svgAsset: 'assets/images/gym.svg',
            onSeeAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ExerciseDetailPage(
                      exerciseName: 'Lifting', category: ''),
                ),
              );
            },
          ),
          ExerciseCard(
            exerciseName: 'Cycling',
            duration: '10 mins',
            calories: '90 cal',
            svgAsset: 'assets/images/bike.svg',
            onSeeAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ExerciseDetailPage(
                      exerciseName: 'Cycling', category: ''),
                ),
              );
            },
          ),

          const SizedBox(height: 16),

          /// ---- Meal Cards ----
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _MealCard(
                  title: 'Snack',
                  description: 'Greek Yogurt',
                  calories: 150,
                  icon: Icons.icecream,
                  color: Colors.yellow[100]!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MealDetailPage(
                          title: 'Snack',
                          description: 'Greek Yogurt',
                          calories: 150,
                          protein: 17,
                          fat: 2,
                          nutrition: {'Carbs': 20, 'Protein': 17, 'Fat': 2},
                          ingredients: ['None(Buy and eat)'],
                          steps: [
                            'Open Lid and enjoy',
                          ],
                        ),
                      ),
                    );
                  },
                ),
                _MealCard(
                  title: 'Snack',
                  description: 'Avocado Toast',
                  calories: 140,
                  icon: Icons.bakery_dining,
                  color: Colors.green[100]!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MealDetailPage(
                          title: 'Snack',
                          description: 'Avocado Toast',
                          calories: 140,
                          protein: 20,
                          fat: 15,
                          nutrition: {'Carbs': 20, 'Protein': 20, 'Fat': 15},
                          ingredients: [
                            "1 slice bread",
                            "1 avocado",
                            "Salt",
                            "Pepper"
                          ],
                          steps: [
                            "Toast bread",
                            "Mash avocado",
                            "Spread on toast",
                            "Season"
                          ],
                        ),
                      ),
                    );
                  },
                ),
                _MealCard(
                  title: 'Snack',
                  description: 'Banana Smoothie',
                  calories: 150,
                  icon: Icons.local_drink,
                  color: Colors.blue[100]!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MealDetailPage(
                          title: 'Snack',
                          description: 'Banana Smoothie',
                          calories: 150,
                          protein: 18,
                          fat: 8,
                          nutrition: {'Carbs': 70, 'Protein': 18, 'Fat': 8},
                          ingredients: [
                            '1 banana',
                            '200ml almond milk',
                            '1 tbsp peanut butter',
                            'Ice cubes'
                          ],
                          steps: ['Blend all ingredients until smooth.'],
                        ),
                      ),
                    );
                  },
                ),
                _MealCard(
                  title: 'Snack',
                  description: 'Celery Sticks ',
                  calories: 190,
                  icon: Icons.eco,
                  color: Colors.green[100]!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MealDetailPage(
                          title: 'Snack',
                          description: 'Celery Sticks with Peanut Butter',
                          calories: 190,
                          protein: 8,
                          fat: 16,
                          nutrition: {'Carbs': 7, 'Protein': 8, 'Fat': 16},
                          ingredients: [
                            "2 stalks celery",
                            "1 tablespoon natural peanut butter (no added sugar)",
                          ],
                          steps: [
                            "Wash celery sticks and cut into manageable pieces",
                            "Spread peanut butter along the celery sticks",
                            "Serve immediately or store dipped celery in fridge briefly."
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
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
        width: 200,
        margin: const EdgeInsets.only(right: 12),
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
                mainAxisAlignment: MainAxisAlignment.center,
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
