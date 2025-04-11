import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/pet_entity.dart';
import 'package:dayonecontacts/features/house_hold/domain/repository/pet_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPetUseCase{
  final PetRepository petRepository;
  GetPetUseCase(this.petRepository);
  Future<Either<Failure,List<PetEntity>>> getPet() {
    return petRepository.getPet();
  }
}