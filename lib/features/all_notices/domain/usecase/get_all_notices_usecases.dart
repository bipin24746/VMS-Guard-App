import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/all_notices/domain/entities/all_notice_integration.dart';
import 'package:dayonecontacts/features/all_notices/domain/repositories/all_notice_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllNoticesUsecase {
  final AllNoticeRepositories allNoticeRepositories;
  GetAllNoticesUsecase(this.allNoticeRepositories);

  Future<Either<Failure, AllNoticesIntegration>> call() async {
    return await allNoticeRepositories.getAllNotices();
  }
}
