import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/data/data_source/current_flat_remote_datasource.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/domain/entity/integration.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/domain/repositories/current_flat_repositories.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: CurrentRepository)
class CurrentFlatRepositoryImpl implements CurrentRepository{
  final CurrentFlatRemoteDataSource remoteDataSource;
  CurrentFlatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure,CurrentFlatIntegration>> getDataFlat() async{
    try{
      final current_flat = await remoteDataSource.getDataFlat();
      return Right(current_flat);
    }
    catch(e){
      return left(ServerFailure(e.toString()));
    }
  }
}