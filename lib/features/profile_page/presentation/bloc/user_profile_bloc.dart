import 'package:bloc/bloc.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_usecase/community_connect_usecase.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_usecase/edit_user_profile_usecase.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_usecase/user_profile_usecase.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_entity/user_profile_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

@injectable
class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileUseCase userProfileUseCase;
  final CommunityConnectUseCase communityConnectUseCase;
  final EditUserProfileUseCase editUserProfileUseCase;

  UserProfileBloc(this.userProfileUseCase, this.communityConnectUseCase, this.editUserProfileUseCase)
      : super(UserProfileInitial()) {
    on<FetchUserProfile>(_onFetchUserProfile);
    on<FetchCommunityConnect>(_onFetchCommunityConnect);
    on<EditUserInfoEvent>(_onEditUserInfoEvent); // Add the event handler for EditUserInfoEvent
  }

  Future<void> _onFetchUserProfile(
      FetchUserProfile event, Emitter<UserProfileState> emit) async {
    emit(UserProfileLoading());

    final result = await userProfileUseCase.getUserProfile();
    result.fold(
          (failure) {
        emit(UserProfileError("Failed to load user profile: $failure"));
      },
          (userProfile) {
        emit(UserProfileLoaded(userProfile));
      },
    );
  }

  Future<void> _onEditUserInfoEvent(
      EditUserInfoEvent event, Emitter<UserProfileState> emit) async { // Define the method to handle EditUserInfoEvent
    emit(UserProfileLoading());

    final result = await editUserProfileUseCase.editUserInfo(
      id: event.id,
      name: event.name,
      dob: event.dob,
      gender: event.gender,
      bloodgroup: event.bloodgroup,
    );
    result.fold(
          (failure) => emit(UserProfileError(failure.message)),
          (response) => emit(EditUserInfoSuccess(response.message)),
    );
  }

  Future<void> _onFetchCommunityConnect(
      FetchCommunityConnect event, Emitter<UserProfileState> emit) async {
    emit(UserProfileLoading());

    final Either<Failure, BaseResponseEntity> result =
    await communityConnectUseCase.communityConnect();

    result.fold(
          (failure) {
        emit(UserProfileError("Failed to load community connect: $failure"));
      },
          (response) {
        emit(CommunityConnectLoaded(response));
      },
    );
  }
}
