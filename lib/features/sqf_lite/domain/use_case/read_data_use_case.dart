

import 'package:dayonecontacts/features/sqf_lite/domain/entity/sqf_lite_entity.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/repository/sqf_lite_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SqfReadDataUseCase {
  final DatabaseRepository repository;

  SqfReadDataUseCase(this.repository);

  Future<List<SqfLiteEntity>> call() async {
    return repository.readData();
  }
}
