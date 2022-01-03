import 'package:shopy/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shopy/model/CartProduct_model.dart';

class CartDB {
  static final String tableName = 'ProductCartTable';
  static final String colName = "name";
  static final String colImage = "image";
  static final String colPrice = "price";
  static final String colQuantity = "quantity";
  static final _dbName = "cartdb.db";
  static final _dbVersion = 1;

  CartDB._privateConstructor();
  static final CartDB db = CartDB._privateConstructor();
  static Database? _database;
  Future get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(path, version: _dbVersion,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableName(
         $colName TEXT PRIMARY KEY ,
        $colImage TEXT ,
    $colPrice TEXT ,
        $colQuantity TEXT 
      )
     ''');
    });
  }

  Future<List> getAllPros() async {
    Database dbClient = await db.database;

    List<Map> maps = await dbClient.query(tableName);
    List list = maps.isNotEmpty
        ? maps.map((Product) => CartProduct().fromjson(Product)).toList()
        : [];

    return list;
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database dbClient = await db.database;
    var result = await dbClient.query(tableName);
    print(result);
    return result;
  }

  insert(CartProduct cartProduct) async {
    Database dbClient = await db.database;
    await dbClient.insert(tableName, cartProduct.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("product added ");
  }
}
