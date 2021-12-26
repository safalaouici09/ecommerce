import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDB {
  CartDB._();
  static final CartDB db = CartDB._();
  static var _database;
  Future get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'dbsql.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(''' ''');
    });
  }
}
