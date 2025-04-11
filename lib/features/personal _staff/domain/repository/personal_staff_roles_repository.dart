import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_roles_entity.dart';

abstract class PersonalStaffRolesRepository{
  Future<Either<Failure,List<PersonalStaffRolesEntity>>> getStaffRoles();
}