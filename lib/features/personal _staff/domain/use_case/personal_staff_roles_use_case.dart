import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_roles_entity.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/repository/personal_staff_roles_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPersonalStaffRolesUseCase {
  final PersonalStaffRolesRepository personalStaffRolesRepository;
  GetPersonalStaffRolesUseCase(this.personalStaffRolesRepository);
  Future<Either<Failure, List<PersonalStaffRolesEntity>>> getStaffRoles() {
    return personalStaffRolesRepository.getStaffRoles();
  }
}
