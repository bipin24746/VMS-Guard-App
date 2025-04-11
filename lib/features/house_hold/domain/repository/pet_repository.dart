import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/pet_entity.dart';


abstract class PetRepository{
  Future<Either<Failure,BaseResponseEntity>> addPet({
    required String type,
    required String name,
    required String gender,
    required String breed,
    required String age,
    File? image,
});

  Future<Either<Failure,BaseResponseEntity>> editPet({
    required String type,
    required String name,
    required String gender,
    required String breed,
    required String age,
    File? image, required String id,
  });
  Future<Either<Failure,List<PetEntity>>> getPet();
  Future<Either<Failure, BaseResponseEntity>> deletePet(String id);
}