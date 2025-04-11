import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/personal%20_staff/data/data_source/staff_roles_remote_data_source.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_roles_entity.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/repository/personal_staff_roles_repository.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: PersonalStaffRolesRepository)
class PersonalStaffRolesImpl implements PersonalStaffRolesRepository{
  final PersonalStaffRolesRemoteDataSource dataSource;
  PersonalStaffRolesImpl(this.dataSource);

  @override
  Future<Either<Failure,List<PersonalStaffRolesEntity>>> getStaffRoles() async{
    try {

      return Right(await dataSource.getStaffRoles());
    } catch (e) {
      return Left(ServerFailure("Error fetching Roles:$e"));
    }
  }
}