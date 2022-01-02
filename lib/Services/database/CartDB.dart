import 'package:shopy/constants.dart';
import 'package:shopy/model/Product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shopy/model/CartProduct_model.dart';

class CartDB {
  CartDB._privateConstructor();
  static final CartDB db = CartDB._privateConstructor();
  static Database? _database;
  Future get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'dbsql.db');
    return await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableName(
         $colName TEXT PRIMARY KEY ,
        $colImage TEXT NOT NULL ,
    $colPrice TEXT NOT NULL ,
        $colQuantity TEXT NOT NULL 
      )
     ''');
    });
  }

  Future<List> getAllPros() async {
    Database dbClient = await database;
    List<Map> maps = await dbClient.query(tableName);
    List list = maps.isNotEmpty
        ? maps.map((Product) => CartProduct().fromjson(Product)).toList()
        : [];

    return list;
  }

  insert(CartProduct cartProduct) async {
    Database dbClient = await database;
    await dbClient.insert(tableName, cartProduct.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("""baaaaaaaaaaaaaaaase""");
    print(dbClient.query(tableName));
  }
}
