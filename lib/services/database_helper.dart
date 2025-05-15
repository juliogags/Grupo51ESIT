import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:control_gastos/models/expense.dart';

class DatabaseHelper {
  static const _databaseName = "ExpensesDatabase.db";
  static const _databaseVersion = 1;
  static const table = 'expenses';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        description TEXT NOT NULL,
        category TEXT NOT NULL,
        amount REAL NOT NULL,
        date TEXT NOT NULL
      )
    ''');
  }

  Future<int> insert(Expense expense) async {
    Database db = await instance.database;
    return await db.insert(table, expense.toMap());
  }

  Future<List<Expense>> getAllExpenses() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(table, orderBy: 'date DESC');
    return List.generate(maps.length, (i) {
      return Expense.fromMap(maps[i]);
    });
  }

  Future<int> update(Expense expense) async {
    Database db = await instance.database;
    return await db.update(
      table,
      expense.toMap(),
      where: 'id = ?',
      whereArgs: [expense.id],
    );
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<double> getTotalExpenses() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT SUM(amount) FROM $table');
    return result.isNotEmpty && result.first['SUM(amount)'] != null
        ? result.first['SUM(amount)'] as double
        : 0.0;
  }
}