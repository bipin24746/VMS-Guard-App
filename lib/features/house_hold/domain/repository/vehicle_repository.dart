import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/vehicle_entity.dart';


abstract class VehicleRepository {
  Future<Either<Failure,BaseResponseEntity>> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  });

  Future<Either<Failure, List<VehicleEntity>>> getVehicles();



  Future<Either<Failure,BaseResponseEntity>> editVehicle({
    required String id,
    required String type,
    required String name,
    required String noplate,
    File? image,
  });

  Future<Either<Failure, BaseResponseEntity>> deleteVehicle(String id);
}