import 'package:dayonecontacts/features/sqf_lite/data/model/sqf_lite_model.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/entity/sqf_lite_entity.dart';


abstract class DatabaseRepository {
  Future<int> addUser(SqfLiteModel modelClass);
  Future<List<SqfLiteEntity>> readData();
  Future<int> deleteUser(int id);
  Future<int> updateUser(SqfLiteModel modelClass);
}
