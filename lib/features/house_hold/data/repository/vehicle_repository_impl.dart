import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/house_hold/data/data_source/vehicle_remote_data_source.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/vehicle_entity.dart';
import 'package:dayonecontacts/features/house_hold/domain/repository/vehicle_repository.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: VehicleRepository)
class VehicleRepositoryImpl implements VehicleRepository {
  final VehicleRemoteDataSource dataSource;

  VehicleRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, BaseResponseEntity>> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  }) async {
    try {
      final result = await dataSource.addVehicle(
        type: type,
        name: name,
        noplate: noplate,
        image: image,
      );
      return Right(BaseResponseModel(message: result));
    } catch (e) {
      return Left(ServerFailure("Error adding vehicle: $e"));
    }
  }

  @override
  Future<Either<Failure, BaseResponseEntity>> editVehicle({
    required String id,
    required String type,
    required String name,
    required String noplate,
    File? image,
  }) async {
    try {
      final result = await dataSource.editVehicle(
        type: type,
        name: name,
        noplate: noplate,
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
      return Left(ServerFailure("Failed to edit vehicle: $e"));
    }
  }

  @override
  Future<Either<Failure, List<VehicleEntity>>> getVehicles() async {
    try {
      final vehiclesRaw = await dataSource.getVehicles();
      return Right(vehiclesRaw);
    } catch (e) {
      return Left(ServerFailure("Error fetching vehicles: $e"));
    }
  }

  @override
  Future<Either<Failure, BaseResponseEntity>> deleteVehicle(
      String vehicleId) async {
    try {
      final result = await dataSource.deleteVehicle(vehicleId);
      return Right(BaseResponseModel(message: result));
    } catch (e) {
      return Left(ServerFailure("Error deleting vehicle: $e"));
    }
  }
}
