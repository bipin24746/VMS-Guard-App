part of 'personal_staff_bloc.dart';

abstract class PersonalStaffEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class CreatePersonalStaffEvent extends PersonalStaffEvent{
  final String name;
  final String contact;
  final String econtact;
  final String bloodGroup;
  final String gender;
  final String staffRoleId;
  final String citizenshipNo;
  final String dob;
  final File? profile;
  final File? citizenshipFrontImage;
  final File? citizenshipBackImage;

  CreatePersonalStaffEvent({
    required this.name,
    required this.contact,
    required this.econtact,
    required this.bloodGroup,
    required this.gender,
    required this.staffRoleId,
    required this.citizenshipNo,
    required this.dob,
    required this.profile,
    required this.citizenshipFrontImage,
    required this.citizenshipBackImage,
});
  @override
  List<Object?> get props => [name,contact,dob,econtact,bloodGroup,gender,staffRoleId,citizenshipNo,profile,citizenshipFrontImage,citizenshipBackImage];
}
class FetchPersonalStaffEvent extends PersonalStaffEvent{}

class FetchPendingStaffEvent extends PersonalStaffEvent{}