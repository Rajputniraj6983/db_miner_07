import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }
  DatabaseHelper._internal();
  Future<Database> get database async {
    if (_database!= null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'quotes.db');
    return await openDatabase(
      path, version: 1, onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, quote TEXT, author TEXT, type TEXT)',
        );
      },
    );
  }
  Future<void> insertFavorite(Map<String, dynamic> quote) async {
    final db = await database;
    await db.insert('favorites', quote,
    );
  }
  Future<void> removeFavorite(int id) async {
    final db = await database;
    await db.delete('favorites', where: 'id = ?', whereArgs: [id],
    );
  }
  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await database;
    return await db.query('favorites');
  }
}