import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_entity/user_profile_entity.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_repository/user_profile_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class UserProfileUseCase {
  final UserProfileRepository userProfileRepository;

  UserProfileUseCase(this.userProfileRepository);

  Future<Either<Failure, UserProfileEntity>> getUserProfile() async {
    return await userProfileRepository.getUserProfile();
  }
}
