import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
  const UserProfileEntity({
    required this.id,
    required this.name,
    required this.dob,
    required this.bloodgroup,
    required this.gender,
    required this.image,
    required this.email,
    required this.contact,
    required this.isSocialized,
    required this.type,
  });

  final String id;
  final String name;
  final String dob;
  final String bloodgroup;
  final String gender;
  final String image;
  final String email;
  final String contact;
  final bool isSocialized;
  final String type;

  @override
  List<Object?> get props =>
      [id, name, gender, image, email, contact, type, isSocialized,dob,bloodgroup ];
}
