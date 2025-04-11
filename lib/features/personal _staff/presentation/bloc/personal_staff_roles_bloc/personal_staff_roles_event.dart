part of 'personal_staff_roles_bloc.dart';

abstract class PersonalStaffRolesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPersonalStaffRolesEvent extends PersonalStaffRolesEvent {}
