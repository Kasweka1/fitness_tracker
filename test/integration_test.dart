// integration_test/app_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_tracker/main.dart';
import 'package:fitness_tracker/services/db/db_helper.dart';
import 'package:fitness_tracker/services/models/workout.dart';

void main() {
  group('End-to-end test', () {
    testWidgets('Insert workout and fetch by date',
        (WidgetTester tester) async {
      // Tap on "Workouts" card in HomeTab
      final workoutsCard = find.text('Workouts');
      expect(workoutsCard, findsOneWidget);
      await tester.tap(workoutsCard);
      await tester.pumpAndSettle();

      // Assume there's a button to "Add Workout"
      final addWorkoutBtn = find.text('Add Workout');
      expect(addWorkoutBtn, findsOneWidget);
      await tester.tap(addWorkoutBtn);
      await tester.pumpAndSettle();

      // Fill form fields (adjust IDs/names to match your UI)
      await tester.enterText(
          find.byKey(const Key('workoutNameField')), 'Cycling');
      await tester.enterText(
          find.byKey(const Key('workoutTypeField')), 'Cardio');
      await tester.enterText(
          find.byKey(const Key('workoutDurationField')), '20');
      await tester.enterText(
          find.byKey(const Key('workoutCaloriesField')), '150');

      // Save workout
      final saveBtn = find.text('Save');
      expect(saveBtn, findsOneWidget);
      await tester.tap(saveBtn);
      await tester.pumpAndSettle();

      // Verify it exists in DB
      final today = DateTime.now().toIso8601String().substring(0, 10);
      final workouts = await DatabaseHelper.instance.fetchWorkoutsByDate(today);

      expect(workouts.isNotEmpty, true);
      expect(workouts.first.name, 'Cycling');
      expect(workouts.first.type, 'Cardio');
      expect(workouts.first.duration, 20);
      expect(workouts.first.caloriesBurned, 150);
    });
  });
}
