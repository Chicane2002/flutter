import 'package:sqflite/sqflite.dart';
// ignore: unused_import
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "simpleData";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'example.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("Creating a new one");
          return db.execute(
            "CREATE TABLE $_tableName ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "text STRING)",
          );
        },
      );
    } catch (e) {
      print("Error initializing db: $e");
    }
  }

  static Future<int> insert(String text) async {
    print("inserting: $text");
    return await _db!.insert(_tableName, {
      'text': text
    }); // Ensure _db is checked for null or guaranteed to be non-null
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("querying");
    return await _db!.query(
        _tableName); // Ensure _db is checked for null or guaranteed to be non-null
  }
}
