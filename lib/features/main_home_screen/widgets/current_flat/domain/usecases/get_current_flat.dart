import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/domain/entity/integration.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/domain/repositories/current_flat_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrentFlat{
  final CurrentRepository repository;
  GetCurrentFlat(this.repository);

  Future<Either<Failure,CurrentFlatIntegration>> call() async{
    return await repository.getDataFlat();
  }
}