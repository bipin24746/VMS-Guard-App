import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/personal%20_staff/data/data_source/staff_remote_data_source.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_entity.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/repository/personal_staff_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PersonalStaffRepository)
class PersonalStaffRepositoryImpl implements PersonalStaffRepository {
  final PersonalStaffRemoteDataSource dataSource;
  PersonalStaffRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, BaseResponseEntity>> addStaff({
    required String name,
    required String contact,
    required String econtact,
    required String bloodGroup,
    required String gender,
    required String staffRoleId,
    required String citizenshipNo,
    required String dob,
    File? profile,
    File? citizenshipFrontImage,
    File? citizenshipBackImage,
  }) async {
    try {
      log("data from repo impl: name: $name, contact:$contact,econtact: $econtact, bloodGroup: $bloodGroup,gender:$gender,staffRoleId:$staffRoleId,citizenshipNo:$citizenshipNo,dob:$dob");
      final result = await dataSource.addStaff(
          name: name,
          contact: contact,
          econtact: econtact,
          bloodGroup: bloodGroup,
          gender: gender,
          staffRoleId: staffRoleId,
          citizenshipNo: citizenshipNo,
          profile: profile,
          citizenshipFrontImage : citizenshipFrontImage,
          citizenshipBackImage: citizenshipBackImage, dob: dob
      );
      return Right(BaseResponseModel(message: result));
    } catch (e) {
      log("error form repoimpl");
      return Left(ServerFailure("Error adding Staffs"));
    }
  }

  @override
  Future<Either<Failure,List<PersonalStaffEntity>>> getPendingStaff() async{
    try{
      return Right(await dataSource.getPendingStaff());
    }
    catch(e){
      return Left(ServerFailure("Error Fetching Pending Staffs: $e"));
    }
  }
}
