part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class EditUserInfoEvent extends UserProfileEvent{
  final String id;
  final String name;
  final String gender;
  final String dob;
  final String bloodgroup;
  EditUserInfoEvent({
    required this.id,
    required this.name,
    required this.gender,
    required this.dob,
    required this.bloodgroup,
});
  @override
  List<Object?> get props => [id,name,gender,dob,bloodgroup,];
}

class FetchUserProfile extends UserProfileEvent{}

class FetchCommunityConnect extends UserProfileEvent{}