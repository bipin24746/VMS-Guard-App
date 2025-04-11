part of 'user_profile_bloc.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState{}
class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserProfileEntity userProfile;

  const UserProfileLoaded(this.userProfile);

  @override
  List<Object> get props => [userProfile];
}

class EditUserInfoSuccess extends UserProfileState{
  final String message;
  EditUserInfoSuccess(this.message);

 @override
  List<Object> get props => [message];
}


class CommunityConnectLoaded extends UserProfileState {
  final BaseResponseEntity response;

  const CommunityConnectLoaded(this.response);

  @override
  List<Object> get props => [response];
}

class UserProfileError extends UserProfileState {
  final String message;

  const UserProfileError(this.message);

  @override
  List<Object> get props => [message];
}
