import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/house_hold/data/data_source/pet_remote_data_source.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/pet_entity.dart';
import 'package:dayonecontacts/features/house_hold/domain/repository/pet_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PetRepository)
class PetRepositoryImpl implements PetRepository {
  final PetRemoteDataSource dataSource;

  PetRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, BaseResponseEntity>> addPet({
    required String type,
    required String name,
    required String gender,
    required String breed,
    required String age,
    File? image,
  }) async {
    try {
      log("Sending data to add pet: type=$type, name=$name, gender=$gender, breed=$breed, age=$age, image=$image");
      final result = await dataSource.addPet(
          type: type,
          name: name,
          gender: gender,
          breed: breed,
          age: age,
          image: image);
      return Right(BaseResponseModel(message: result));
    } catch (e) {
      log("error");
      return Left(ServerFailure("Error adding pet"));
    }
  }

  @override
  Future<Either<Failure, BaseResponseEntity>> editPet({
    required String id,
    required String type,
    required String name,
    required String gender,
    required String breed,
    required String age,
    File? image,
  }) async {
    try {
      final result = await dataSource.editPet(
        type: type,
        name: name,
        age: age,
        gender: gender,
        breed: breed,
        image: image,
        id: id,
      );
      return Right(BaseResponseModel(message: result));
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure("Network error occurred: ${e.message}"));
      } else if (e is SocketException) {
        return Left(ServerFailure("No internet connection"));
      }
      return Left(ServerFailure("Failed to edit Pet: $e"));
    }
  }

  @override
  Future<Either<Failure, List<PetEntity>>> getPet() async {
    try {

      return Right(await dataSource.getPet());
    } catch (e) {
      return Left(ServerFailure("Error fetching Pets:$e"));
    }
  }

  @override
  Future<Either<Failure, BaseResponseEntity>> deletePet(String petId) async {
    try {
      final result = await dataSource.deletePet(petId);
      return Right(BaseResponseModel(message: result));
    } catch (e) {
      return Left(ServerFailure("Error deleting Pet: $e"));
    }
  }
}
