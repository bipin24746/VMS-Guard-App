import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/domain/entity/integration.dart';

abstract class CurrentRepository{
  Future<Either<Failure,CurrentFlatIntegration>> getDataFlat();
}