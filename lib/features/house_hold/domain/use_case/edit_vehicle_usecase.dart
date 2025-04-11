import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/house_hold/domain/repository/vehicle_repository.dart';

import 'package:injectable/injectable.dart';


@lazySingleton

class EditVehicleUseCase {
  final VehicleRepository vehicleRepository;

  EditVehicleUseCase(this.vehicleRepository);

  Future<Either<Failure, BaseResponseEntity>> editVehicle({
    required String id,
    required String type,
    required String name,
    required String noplate,
    File? image,
  }) async {
    return vehicleRepository.editVehicle(type: type, name: name, noplate: noplate, id: id, image: image,);

  }
}
