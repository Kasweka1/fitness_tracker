import 'dart:async';
import 'package:fitness_tracker/services/models/meal.dart';
import 'package:fitness_tracker/services/models/user.dart';
import 'package:fitness_tracker/services/models/workout.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('fitness_tracker.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE meals(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        calories REAL,
        protein REAL,
        carbs REAL,
        fat REAL,
        date TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE workouts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT,
        calories REAL,
        date TEXT
      )
    ''');
  }

  // ---------- USER METHODS ----------
  Future<int> registerUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> loginUser(String username, String password) async {
    final db = await instance.database;
    final maps = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (maps.isNotEmpty) {
      return User(
        id: maps.first['id'] as int,
        username: maps.first['username'] as String,
        password: maps.first['password'] as String,
        email: maps.first['email'] as String,
      );
    }
    return null;
  }

  Future<List<User>> getAllUsers() async {
    final db = await instance.database;
    final result = await db.query('users');

    return result.map((map) {
      return User(
        id: map['id'] as int,
        username: map['username'] as String,
        password: map['password'] as String,
        email: map['email'] as String,
      );
    }).toList();
  }

  // ---------- MEAL METHODS ----------
  Future<void> insertMeal(Meal meal) async {
    final db = await instance.database;
    await db.insert('meals', meal.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Meal>> getMeals() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'meals',
      orderBy: "date DESC", // show most recent first
    );

    return List.generate(maps.length, (i) {
      return Meal(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        calories: maps[i]['calories']?.toDouble() ?? 0.0,
        protein: maps[i]['protein']?.toDouble() ?? 0.0,
        carbs: maps[i]['carbs']?.toDouble() ?? 0.0,
        fat: maps[i]['fat']?.toDouble() ?? 0.0,
        date: maps[i]['date'],
      );
    });
  }

  Future<List<Meal>> fetchMealsByDate(String date) async {
    final db = await instance.database;
    final result =
        await db.query('meals', where: 'date = ?', whereArgs: [date]);

    return result.map((map) {
      return Meal(
        id: map['id'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        calories: map['calories'] as double,
        protein: map['protein'] as double,
        carbs: map['carbs'] as double,
        fat: map['fat'] as double,
        date: map['date'] as String,
      );
    }).toList();
  }

  // ---------- WORKOUT METHODS ----------
  Future<void> insertWorkout(Workout workout) async {
    final db = await instance.database;
    await db.insert('workouts', workout.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Workout>> fetchWorkoutsByDate(String date) async {
    final db = await instance.database;
    final result =
        await db.query('workouts', where: 'date = ?', whereArgs: [date]);

    return result.map((map) {
      return Workout(
        id: map['id'] as int,
        type: map['type'] as String,
        calories: map['calories'] as double,
        date: map['date'] as String,
        name: map['name'] as String,
        duration: map['duration'] as int,
        caloriesBurned: map['calories_burned'] as double,
      );
    }).toList();
  }
}
