import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:fitness_tracker/services/models/user.dart';
import 'package:fitness_tracker/services/models/meal.dart';
import 'package:fitness_tracker/services/models/workout.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'fitness_tracker.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
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
            name Text,
            type TEXT,
            duration INTEGER,
            caloriesBurned REAL,
            date TEXT
          )
        ''');
      },
    );
  }

  // =====================
  // USER METHODS
  // =====================
  Future<int> registerUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> loginUser(String username, String password) async {
    final db = await database;
    final res = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }

  Future<List<User>> getAllUsers() async {
    final db = await database;
    final res = await db.query('users');
    return res.map((e) => User.fromMap(e)).toList();
  }

  // =====================
  // MEAL METHODS
  // =====================
  Future<int> insertMeal(Meal meal) async {
    final db = await database;
    return await db.insert('meals', meal.toMap());
  }

  Future<List<Meal>> fetchMealsByDate(String date) async {
    final db = await database;
    final res = await db.query(
      'meals',
      where: 'date = ?',
      whereArgs: [date],
    );
    return res.map((e) => Meal.fromMap(e)).toList();
  }

  // =====================
  // WORKOUT METHODS
  // =====================
  Future<int> insertWorkout(Workout workout) async {
    final db = await database;
    return await db.insert('workouts', workout.toMap());
  }

  Future<List<Workout>> fetchWorkoutsByDate(String date) async {
    final db = await database;
    final res = await db.query(
      'workouts',
      where: 'date = ?',
      whereArgs: [date],
    );
    return res.map((e) => Workout.fromMap(e)).toList();
  }
}
