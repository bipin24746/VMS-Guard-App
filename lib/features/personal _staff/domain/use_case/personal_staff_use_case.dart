import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/repository/personal_staff_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddPersonalStaffUseCase {
  final PersonalStaffRepository personalStaffRepository;
  AddPersonalStaffUseCase(this.personalStaffRepository);

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
    return personalStaffRepository.addStaff(
        name: name,
        contact: contact,
        econtact: econtact,
        bloodGroup: bloodGroup,
        gender: gender,
        staffRoleId: staffRoleId,
        citizenshipNo: citizenshipNo,
        dob: dob,
        profile: profile,
        citizenshipFrontImage: citizenshipFrontImage,
        citizenshipBackImage: citizenshipBackImage);
  }
}
