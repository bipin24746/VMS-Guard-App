import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_repository/user_profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CommunityConnectUseCase{
  final UserProfileRepository userProfileRepository;
  CommunityConnectUseCase(this.userProfileRepository);
  Future<Either<Failure,BaseResponseEntity>> communityConnect()async{
    return userProfileRepository.communityConnect();
  }
}