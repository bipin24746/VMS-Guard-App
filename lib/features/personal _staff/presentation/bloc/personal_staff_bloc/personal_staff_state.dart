part of 'personal_staff_bloc.dart';

abstract class PersonalStaffState extends Equatable{
  @override
  List<Object?> get props => [];
}

class PersonalStaffInitial extends PersonalStaffState{}

class PersonalStaffLoading extends PersonalStaffState{}

class PersonalStaffSuccess extends PersonalStaffState{
  final String message;
  PersonalStaffSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class PersonalStaffFetchSuccess extends PersonalStaffState{
  final List<PersonalStaffEntity> personalStaffRoles;
  PersonalStaffFetchSuccess(this.personalStaffRoles);

  @override
  List<Object?> get props => [personalStaffRoles];
}

class PendingStaffFetchSuccess extends PersonalStaffState{
  final List<PersonalStaffEntity> pendingStaff;
  PendingStaffFetchSuccess(this.pendingStaff);

  @override
  List<Object?> get props => [pendingStaff];
}

class PersonalStaffFailure extends PersonalStaffState{
  final String error;
  PersonalStaffFailure(this.error);

  @override
  List<Object?> get props => [error];
}