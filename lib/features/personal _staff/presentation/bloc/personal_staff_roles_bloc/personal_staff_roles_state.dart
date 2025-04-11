part of 'personal_staff_roles_bloc.dart';

abstract class PersonalStaffRolesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PersonalStaffRolesInitial extends PersonalStaffRolesState {}

class PersonalStaffRolesLoading extends PersonalStaffRolesState {}

class PersonalStaffRolesFetchSuccess extends PersonalStaffRolesState {
  final List<PersonalStaffRolesEntity> personalStaffRoles;  // Updated to match the entity

  PersonalStaffRolesFetchSuccess(this.personalStaffRoles);

  @override
  List<Object?> get props => [personalStaffRoles];
}

class PersonalStaffRolesFailure extends PersonalStaffRolesState {
  final String error;

  PersonalStaffRolesFailure(this.error);

  @override
  List<Object?> get props => [error];
}
