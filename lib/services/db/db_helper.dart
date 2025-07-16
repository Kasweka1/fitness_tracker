import 'package:fitness_tracker/services/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // your model

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    return _database ??= await _initDB('fitness.db');
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    print('📂 SQLite DB Path: $path');
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
  }

  Future<int> registerUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> loginUser(String username, String password) async {
  final db = await instance.database;
  final result = await db.query(
    'users',
    where: 'username = ? AND password = ?',
    whereArgs: [username, password],
  );
  if (result.isNotEmpty) {
    return User.fromMap(result.first);
  }
  return null;
}


  Future<List<User>> getAllUsers() async {
    final db = await instance.database;
    final result = await db.query('users');
    return result.map((json) => User.fromMap(json)).toList();
  }
}
