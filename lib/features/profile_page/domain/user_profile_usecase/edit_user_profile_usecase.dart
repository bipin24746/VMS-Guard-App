import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_repository/user_profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditUserProfileUseCase {
  final UserProfileRepository userProfileRepository;
  EditUserProfileUseCase(this.userProfileRepository);

  Future<Either<Failure, BaseResponseEntity>> editUserInfo({
    required String id,
    required String name,
    required String gender,
    required String dob,
    required String bloodgroup,
  }) async {
    return userProfileRepository.editUserInfo(
        id: id, name: name, gender: gender,dob: dob, bloodgroup: bloodgroup);
  }
}
