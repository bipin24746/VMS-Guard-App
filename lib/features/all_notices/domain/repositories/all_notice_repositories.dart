import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/all_notices/domain/entities/all_notice_integration.dart';

abstract class AllNoticeRepositories{
  Future<Either<Failure,AllNoticesIntegration>> getAllNotices();
}