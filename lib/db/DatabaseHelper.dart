import 'package:nev_news_with_mvvm/models/NewsResponseModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "News.db";
  static const String _TableName = "News";

  static DatabaseHelper db = DatabaseHelper();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE News (id INTEGER PRIMARY KEY,source TEXT,author TEXT,title TEXT,description TEXT,url TEXT,urlToImage TEXT, publishedAt TEXT, content TEXT)");
  }

  Future<bool> isAlreadyAdded(String url) async {
    final db = await database;
    var result = await db.query(_TableName, where: "url=?", whereArgs: [url]);
    return result.isNotEmpty;
  }

  Future<int> delete(String url) async {
    final db = await database;
    var result = await db.delete(_TableName, where: "url=?", whereArgs: [url]);
    return result;
  }

  Future<int> insertNews(Articles articles) async {
    final db = await database;
    return await db.insert(_TableName, articles.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Articles>> getAllSavedNews() async {
    final db = await database;
    final List<Map<String, dynamic>> newsList = await db.query(_TableName);

    if (newsList.isEmpty) {
      return [];
    }
    return List.generate(
        newsList.length, (index) => Articles.fromJson(newsList[index]));
  }
}
