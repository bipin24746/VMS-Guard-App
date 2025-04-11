import 'package:dayonecontacts/features/profile_page/domain/user_profile_entity/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.id,
    required super.name,
    required super.dob,
    required super.bloodgroup,
    required super.gender,
    required super.contact,
    required super.email,
    required super.isSocialized,

    required super.image,
    required super.type,

  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['data']['id'] as String? ?? '',
      name: json['data']['name'] as String? ?? '',
      dob: json['data']['dob'] as String? ?? '',
      bloodgroup: json['data']['bloodgroup'] as String? ?? '',
      gender: json['data']['gender'] as String? ?? '',
      contact: json['data']['contact'] as String? ?? '',
      email: json['data']['email'] as String? ?? '',
      isSocialized: json['data']['isSocialized'] as bool? ?? false,

      image: json['data']['image'] as String? ?? '',
      type: json['data']['type'] as String? ?? '',
    );
  }
}


