import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/all_notices/data/data_source/all_notices_remote_datasource.dart';
import 'package:dayonecontacts/features/all_notices/domain/entities/all_notice_integration.dart';
import 'package:dayonecontacts/features/all_notices/domain/repositories/all_notice_repositories.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: AllNoticeRepositories)
class AllNoticesRepositoryImplementation implements AllNoticeRepositories{
  final AllNoticeRemoteDataSource allNoticeRemoteDataSource;
  AllNoticesRepositoryImplementation(this.allNoticeRemoteDataSource);

  @override
  Future<Either<Failure, AllNoticesIntegration>> getAllNotices() async {
    try{
      final allNotice = await allNoticeRemoteDataSource.getAllNotices();
      return Right(allNotice);
    }
    catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }
}