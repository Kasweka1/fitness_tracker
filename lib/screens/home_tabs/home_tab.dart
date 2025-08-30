import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// Import new pages
import 'package:fitness_tracker/screens/daily_activity_page.dart';
import 'package:fitness_tracker/screens/workouts/workouts_page.dart';
import 'package:fitness_tracker/screens/hydration_page.dart';
import 'package:fitness_tracker/screens/workouts/exercise_detail_page.dart';
import 'package:fitness_tracker/screens/food_detail_page.dart';

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
      child: Padding(
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
                            builder: (context) => const DailyActivityPage()),
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
                        MaterialPageRoute(
                            builder: (context) => const WorkoutsPage()),
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
                        MaterialPageRoute(
                            builder: (context) => const HydrationPage()),
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
                    builder: (context) => const ExerciseDetailPage(
                      exerciseName: 'Lifting', category: '',
                      // duration: '15 mins',
                      // calories: '120 cal',
                    ),
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
                    builder: (context) => const ExerciseDetailPage(
                      exerciseName: 'Cycling',
                      category: ''
                      // duration: '10 mins',
                      // calories: '90 cal', 
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            /// ---- Food Cards ----
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FoodCard(
                    foodName: 'Avocado Toast',
                    calories: '250 cal',
                    serving: '1 slice',
                    svgAsset: 'assets/images/avacado.svg',
                    onStart: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FoodDetailPage(
                            foodName: 'Avocado Toast',
                            calories: '250 cal',
                            serving: '1 slice',
                            title: '',
                            ingredients: [],
                            steps: [],
                          ),
                        ),
                      );
                    },
                  ),
                  FoodCard(
                    foodName: 'Greek Yogurt',
                    calories: '100 cal',
                    serving: '1 cup',
                    svgAsset: 'assets/images/yogurt.svg',
                    onStart: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FoodDetailPage(
                            foodName: 'Greek Yogurt',
                            calories: '100 cal',
                            serving: '1 cup',
                            title: '',
                            ingredients: [],
                            steps: [],
                          ),
                        ),
                      );
                    },
                  ),
                  FoodCard(
                    foodName: 'Banana Smoothie',
                    calories: '180 cal',
                    serving: '300 ml',
                    svgAsset: 'assets/images/banana.svg',
                    onStart: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FoodDetailPage(
                            foodName: 'Banana Smoothie',
                            calories: '180 cal',
                            serving: '300 ml',
                            title: '',
                            ingredients: [],
                            steps: [],
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
      ),
    );
  }
}
