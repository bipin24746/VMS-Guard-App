import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';

import '../entities/integration.dart';

abstract class NoticeRepository {
  Future<Either<Failure, Integration>> getNotices();
}
