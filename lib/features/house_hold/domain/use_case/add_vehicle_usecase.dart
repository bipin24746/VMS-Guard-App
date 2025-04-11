import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/house_hold/domain/repository/vehicle_repository.dart';

import 'package:injectable/injectable.dart';

@lazySingleton

class AddVehicleUseCase  {
  final VehicleRepository vehicleRepository;
  AddVehicleUseCase(this.vehicleRepository);

  Future<Either<Failure, BaseResponseEntity>> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  }) async {
    return  vehicleRepository.addVehicle(type: type, name: name, noplate: noplate,image: image);
  }


}
