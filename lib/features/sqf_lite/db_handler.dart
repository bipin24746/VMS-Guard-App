// import 'dart:io';
// import 'package:dayonecontacts/features/sqf_lite/sqf_model_class.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DBHandler {
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path, 'mydatabase.db');
//
//     // await deleteDatabase(path);
//
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         print("Database Created!");
//         await db.execute('''
//         CREATE TABLE DatabaseTable (
//           id INTEGER PRIMARY KEY AUTOINCREMENT,
//           name TEXT,
//           age INTEGER
//         )
//       ''');
//         print("Table Created!");
//       },
//     );
//   }
//
//   Future<int> insertData(ModelClass modelClass) async {
//     final db = await database;
//     // Map<String, Object?> map = {
//     //   'id': id,
//     //   'name': name,
//     //   'age': age
//     // };
//     return await db.insert('DatabaseTable', modelClass.toMap());
//   }
//
//   Future<List<ModelClass>> readData() async {
//     final db = await database;
//     final list = await db.query('DatabaseTable');
//
//     return list.map((map) => ModelClass.fromMap(map)).toList();
//   }
//
//   Future<int> deleteData(int id) async {
//     Database? db = await database;
//     // int id = 4;
//     return await db.delete('DatabaseTable', where: 'id = ?', whereArgs: [id]);
//   }
//
//   Future<int> updateData(int id, ModelClass modelClass) async {
//     Database? db = await database;
//     return await db.update(
//       'DatabaseTable',
//       modelClass.toMap(),
//       where: 'id = ?',
//       whereArgs: [modelClass.id],
//     );
//   }
// }
