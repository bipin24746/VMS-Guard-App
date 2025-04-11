import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/house_hold/domain/repository/pet_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditPetUseCase{
  final PetRepository petRepository;
  EditPetUseCase(this.petRepository);

  Future<Either<Failure, BaseResponseEntity>> editPet({
    required String id,
    required String type,
    required String name,
    required String gender,
    required String breed,
    required String age,
    File? image,
  }) async {
    return petRepository.editPet(id:id, type: type, name: name, gender: gender, breed: breed, age: age,image: image);

  }
}