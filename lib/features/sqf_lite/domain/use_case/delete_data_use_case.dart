import 'package:dayonecontacts/features/sqf_lite/domain/repository/sqf_lite_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SqfDeleteDataUsecase {
  final DatabaseRepository repository;

  SqfDeleteDataUsecase(this.repository);

  Future<int> call(int id) async {
    return await repository.deleteUser(id);
  }
}
