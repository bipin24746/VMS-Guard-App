import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/login_entity/auth_response_entity.dart';



abstract class AuthRepository {
  Future<Either<Failure, AuthResponseEntity>> performAuth({
    required String phoneNumber,
    // required int countryCode,
  });
}
