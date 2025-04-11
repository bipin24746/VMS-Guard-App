import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_entity.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/repository/personal_staff_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPendingStaffUsecase {
  final PersonalStaffRepository personalStaffRepository;
  GetPendingStaffUsecase(this.personalStaffRepository);
  Future<Either<Failure, List<PersonalStaffEntity>>> getPendingStaff() {
    return personalStaffRepository.getPendingStaff();
  }
}
