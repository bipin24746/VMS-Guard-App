import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_roles_entity.dart';

class PersonalStaffRoleModel extends PersonalStaffRolesEntity {
  const PersonalStaffRoleModel({
    required super.id,
    required super.name
  });
  factory PersonalStaffRoleModel.fromJson(Map<String, dynamic> json) {
    return PersonalStaffRoleModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }
}
