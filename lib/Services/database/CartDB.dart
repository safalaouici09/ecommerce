import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shopy/model/CartProduct_model.dart';

class DatabaseHelper {
  static final _databaseName = "myBase3.db";
  static final _databaseVersion = 1;
  static final table = "CartTable";
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnPrice = 'price';
  static final columnQuantity = 'quantity';
  static final columnImage = 'image';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $table (
    $columnId  TEXT NOT NULL PRIMARY KEY ,
    $columnName TEXT NOT NULL ,
    $columnPrice TEXT NOT NULL , 
    $columnImage TEXT NOT NULL,
    $columnQuantity INTEGER NOT NULL
  )
  ''');
  }

  Future<int> insert(CartProduct cartProduct) async {
    Database db = await instance.database;
    var res = await db.insert(table, cartProduct.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    var res = await db.query(table);
    return res;
  }

  Future<void> update(CartProduct cartProduct) async {
    Database db = await instance.database;
    await db.update(table, cartProduct.toMap(),
        where: "id = ?", whereArgs: [cartProduct.id]);
  }
}
