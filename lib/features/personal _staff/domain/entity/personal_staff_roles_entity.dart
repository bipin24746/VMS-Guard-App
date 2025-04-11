import 'package:equatable/equatable.dart';

class PersonalStaffRolesEntity extends Equatable {
  const PersonalStaffRolesEntity({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];


}
