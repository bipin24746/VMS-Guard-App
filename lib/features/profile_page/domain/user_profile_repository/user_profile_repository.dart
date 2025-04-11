import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_entity/user_profile_entity.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserProfileEntity>> getUserProfile();

  Future<Either<Failure,BaseResponseEntity>> editUserInfo({
    required String id,
    required String name,
    required String gender,
    required String dob,
    required String bloodgroup,
});
  Future<Either<Failure,BaseResponseEntity>> communityConnect();
}
