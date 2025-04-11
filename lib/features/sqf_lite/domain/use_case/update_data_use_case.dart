import 'package:dayonecontacts/features/sqf_lite/data/model/sqf_lite_model.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/entity/sqf_lite_entity.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/repository/sqf_lite_repository.dart';
import 'package:dayonecontacts/features/sqf_lite/sqf_model_class.dart';
import 'package:injectable/injectable.dart';

@injectable
class SqfUpdateDataUseCase {
  final DatabaseRepository repository;

  SqfUpdateDataUseCase(this.repository);

  Future<int> call(SqfLiteEntity user) async {
    // Convert SqfLiteEntity to ModelClass
    final model = SqfLiteModel(id: user.id, name: user.name, age: user.age);
    return await repository.updateUser(model);
  }
}
