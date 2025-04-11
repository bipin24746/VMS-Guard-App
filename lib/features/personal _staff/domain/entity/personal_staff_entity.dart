import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_roles_entity.dart';
import 'package:equatable/equatable.dart';

class PersonalStaffEntity extends Equatable {
  const PersonalStaffEntity({
    required this.id,
    required this.name,
    required this.contact,
    required this.econtact,
    required this.bloodGroup,
    required this.gender,
    required this.staffRoleId,
    required this.citizenshipNo,
    required this.dob,
    this.profileUrl,
    this.citizenshipFrontImageUrl,
    this.citizenshipBackImageUrl,
  });
  final String id;
  final String name;
  final String contact;
  final String econtact;
  final String bloodGroup;
  final String gender;
  final PersonalStaffRolesEntity staffRoleId;
  final String citizenshipNo;
  final String dob;
  final String? profileUrl;
  final String? citizenshipFrontImageUrl;
  final String? citizenshipBackImageUrl;

  @override
  List<Object?> get props => [
        id,
        name,
        dob,
        contact,
        econtact,
        bloodGroup,
        gender,
        staffRoleId,
        citizenshipNo,
        profileUrl,
        citizenshipFrontImageUrl,
        citizenshipBackImageUrl
      ];
}
