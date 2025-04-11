import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:injectable/injectable.dart';
import '../repositories/notice_repository.dart';
import '../entities/integration.dart';

@lazySingleton
class GetNoticesUsecase {
  final NoticeRepository repository;

  GetNoticesUsecase(this.repository);

  Future<Either<Failure, Integration>> call() async {
    return await repository.getNotices();
  }
}