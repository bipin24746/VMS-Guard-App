import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_entity.dart';

abstract class PersonalStaffRepository {
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
  });
  Future<Either<Failure, List<PersonalStaffEntity>>> getPendingStaff();
}
