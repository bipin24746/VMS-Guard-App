import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/features/house_hold/domain/repository/pet_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/errors/failures.dart';

@lazySingleton
class DeletePetUseCase{
  final PetRepository petRepository;
  DeletePetUseCase(this.petRepository);
  Future<Either<Failure, BaseResponseEntity>> deletePet(String petId) {
    return petRepository.deletePet(petId);
  }
}