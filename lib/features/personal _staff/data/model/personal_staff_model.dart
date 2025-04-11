// personal_staff_model.dart

import 'package:dayonecontacts/features/personal%20_staff/data/model/personal_staff_roles_model.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_entity.dart';

class PersonalStaffModel extends PersonalStaffEntity {
  const PersonalStaffModel({
    required super.id,
    required super.name,
    required super.contact,
    required super.econtact,
    required super.bloodGroup,
    required super.gender,
    required super.staffRoleId,
    required super.citizenshipNo,
    required super.dob,
    required super.profileUrl,
    required super.citizenshipFrontImageUrl,
    required super.citizenshipBackImageUrl,
  });


  factory PersonalStaffModel.fromJson(Map<String, dynamic> json) {
    var staffRole = json['personalStaffRole'] != null
        ? PersonalStaffRoleModel.fromJson(json['personalStaffRole'])
        : PersonalStaffRoleModel(id: '', name: '');
    return PersonalStaffModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      contact: json['contact'] as String? ?? '',
      econtact: json['econtact'] as String? ?? '',
      bloodGroup: json['bloodGroup'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      staffRoleId: staffRole, //passing the staffrole entity
      citizenshipNo: json['citizenshipNo'] as String? ?? '',
      dob: json['dob'] as String? ?? '',
      profileUrl:
          json['image'] != null ? json['image']['url'] as String? ?? '' : '',
      citizenshipFrontImageUrl: json['citizenshipFrontImage'] as String? ?? '',
      citizenshipBackImageUrl: json['citizenshipBackImage'] as String? ?? '',
    );

  }

}
