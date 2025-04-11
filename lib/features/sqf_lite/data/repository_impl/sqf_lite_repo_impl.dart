import 'package:dayonecontacts/features/sqf_lite/data/data_source/sqf_lite_remote_data_source.dart';
import 'package:dayonecontacts/features/sqf_lite/data/model/sqf_lite_model.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/entity/sqf_lite_entity.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/repository/sqf_lite_repository.dart';
import 'package:dayonecontacts/features/sqf_lite/sqf_model_class.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DatabaseRepository)
class DatabaseRepositoryImpl implements DatabaseRepository {
  final DBHandler dbHandler;

  DatabaseRepositoryImpl({required this.dbHandler});

  @override
  Future<int> addUser(SqfLiteModel modelClass) async {
    final model = SqfLiteModel(name: modelClass.name, age: modelClass.age);
    return await dbHandler.insertData(model);
  }

  @override
  Future<List<SqfLiteEntity>> readData() async {
    final users = await dbHandler.readData();
    return users.map((user) => SqfLiteEntity(id: user.id, name: user.name, age: user.age)).toList();
  }

  @override
  Future<int> deleteUser(int id) async {
    return await dbHandler.deleteData(id);
  }

  @override
  Future<int> updateUser(SqfLiteModel modelClass) async {
    final model = SqfLiteModel(id: modelClass.id, name: modelClass.name, age: modelClass.age);
    return await dbHandler.updateData(model);
  }
}
