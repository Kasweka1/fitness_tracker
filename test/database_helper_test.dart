// test/services/db/database_helper_test.dart
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_common_ffi.dart';

import 'package:fitness_tracker/services/db/db_helper.dart';
import 'package:fitness_tracker/services/models/user.dart';
import 'package:fitness_tracker/services/models/meal.dart';
import 'package:fitness_tracker/services/models/workout.dart';

Future<void> _deleteAppDb() async {
  final dbPath = await getDatabasesPath();
  final path = p.join(dbPath, 'fitness_tracker.db');
  if (await File(path).exists()) {
    await deleteDatabase(path);
  }
}

void main() {
  // Use FFI so sqflite works in test VM
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  group('DatabaseHelper', () {
    late DatabaseHelper db;

    setUp(() async {
      // Clean DB before each test to avoid cross-test pollution
      await _deleteAppDb();
      db = DatabaseHelper.instance;
      await db.database; // ensure opened & created
    });

    tearDown(() async {
      // Optional: close and delete DB after each test
      final database = await db.database;
      await database.close();
      await _deleteAppDb();
    });

    test('registerUser + getAllUsers + loginUser success/failure', () async {
      final id = await db.registerUser(User(
        username: 'alice',
        email: 'alice@example.com',
        password: 'pw123',
      ));
      expect(id, greaterThan(0));

      final all = await db.getAllUsers();
      expect(all.length, 1);
      expect(all.first.username, 'alice');

      final loggedIn = await db.loginUser('alice', 'pw123');
      expect(loggedIn, isNotNull);
      expect(loggedIn!.email, 'alice@example.com');

      final badLogin = await db.loginUser('alice', 'wrong');
      expect(badLogin, isNull);
    });

    test('insertMeal + fetchMealsByDate', () async {
      final today = DateTime.now().toIso8601String().substring(0, 10);

      final m1 = Meal(
        title: 'Breakfast',
        description: 'Oats and berries',
        calories: 320,
        protein: 10,
        carbs: 55,
        fat: 5,
        date: today,
      );
      final m2 = Meal(
        title: 'Lunch',
        description: 'Chicken & rice',
        calories: 540,
        protein: 45,
        carbs: 60,
        fat: 12,
        date: today,
      );

      final id1 = await db.insertMeal(m1);
      final id2 = await db.insertMeal(m2);
      expect(id1, greaterThan(0));
      expect(id2, greaterThan(0));

      final meals = await db.fetchMealsByDate(today);
      expect(meals.length, 2);

      final totalCals = meals.fold<double>(0, (sum, m) => sum + m.calories);
      expect(totalCals, 860); // 320 + 540
    });

    test('insertWorkout + fetchWorkoutsByDate', () async {
      final today = DateTime.now().toIso8601String().substring(0, 10);

      final w1 = Workout(
        name: 'Lifting',
        type: 'Strength',
        duration: 15,
        caloriesBurned: 120,
        date: today,
      );
      final w2 = Workout(
        name: 'Cycling',
        type: 'Cardio',
        duration: 10,
        caloriesBurned: 90,
        date: today,
      );

      await db.insertWorkout(w1);

      final workouts = await db.fetchWorkoutsByDate(today);
      expect(workouts.length, 2);

      final totalBurn =
          workouts.fold<double>(0, (sum, w) => sum + w.caloriesBurned);
      expect(totalBurn, 210); // 120 + 90
    });
  });
}
