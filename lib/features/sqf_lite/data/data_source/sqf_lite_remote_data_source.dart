import 'dart:io';
import 'package:dayonecontacts/features/sqf_lite/data/model/sqf_lite_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

abstract class DBHandler {
  Future<int> insertData(SqfLiteModel sqfLiteModel);
  Future<List<SqfLiteModel>> readData();
  Future<int> deleteData(int id);
  Future<int> updateData(SqfLiteModel sqfLiteModel);
}

@LazySingleton(as: DBHandler)
class DBHandlerImpl implements DBHandler {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'mydatabase.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE DatabaseTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          age INTEGER
        )
        ''');
      },
    );
  }

  @override
  Future<int> insertData(SqfLiteModel sqfLiteModel) async {
    final db = await database;
    return await db.insert('DatabaseTable', sqfLiteModel.toMap());
  }

  @override
  Future<List<SqfLiteModel>> readData() async {
    final db = await database;
    final list = await db.query('DatabaseTable');
    return list.map((map) => SqfLiteModel.fromMap(map)).toList();
  }

  @override
  Future<int> deleteData(int id) async {
    final db = await database;
    return await db.delete('DatabaseTable', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> updateData(SqfLiteModel sqfLiteModel) async {
    final db = await database;
    return await db.update(
      'DatabaseTable',
      sqfLiteModel.toMap(),
      where: 'id = ?',
      whereArgs: [sqfLiteModel.id],
    );
  }
}
