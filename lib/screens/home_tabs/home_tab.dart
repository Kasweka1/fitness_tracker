import 'package:fitness_tracker/screens/widgets/home/exercice_card.dart';
import 'package:fitness_tracker/screens/widgets/home/fitnessCard.dart';
import 'package:fitness_tracker/screens/widgets/home/food_card.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
            Text(
              'Recent Activity',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 16),
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
                    onTap: () {},
                  ),
                  FitnessCard(
                    title: 'Workouts',
                    subtitle: 'Lifting weights',
                    icon: LineAwesomeIcons.dumbbell_solid,
                    backgroundColor: colors.error,
                    onTap: () {},
                  ),
                  FitnessCard(
                    title: 'Hydration',
                    subtitle: '8 glasses today?',
                    icon: LineAwesomeIcons.water_solid,
                    backgroundColor: Colors.blue,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Exercise',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: colors.primary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle 'See all' tap
                      },
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: colors.secondary,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ExerciseCard(
                  exerciseName: 'Lifting',
                  duration: '15 mins',
                  calories: '120 cal',
                  svgAsset: 'assets/images/gym.svg',
                  onSeeAll: () {
                    // Navigate or show full list
                  },
                ),
                ExerciseCard(
                  exerciseName: 'Cycling',
                  duration: '10 mins',
                  calories: '90 cal',
                  svgAsset: 'assets/images/bike.svg',
                  onSeeAll: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'Food and Diet',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        color: colors.primary,
      ),
    ),
    TextButton(
      onPressed: () {
        // Handle 'See all' tap
      },
      child: const Text(
        'See all',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextButton.styleFrom(
        foregroundColor: colors.secondary,
        padding: EdgeInsets.zero,
      ),
    ),
  ],
),

                const SizedBox(height: 16),
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
                          // start diet or log food
                        },
                      ),
                      FoodCard(
                        foodName: 'Greek Yogurt',
                        calories: '100 cal',
                        serving: '1 cup',
                        svgAsset: 'assets/images/yogurt.svg',
                        onStart: () {},
                      ),
                      FoodCard(
                        foodName: 'Banana Smoothie',
                        calories: '180 cal',
                        serving: '300 ml',
                        svgAsset: 'assets/images/banana.svg',
                        onStart: () {},
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}




