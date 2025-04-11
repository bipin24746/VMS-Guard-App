import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/house_hold/domain/repository/vehicle_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteVehicleUseCase {
  final VehicleRepository vehicleRepository;

  DeleteVehicleUseCase(this.vehicleRepository);

  Future<Either<Failure, BaseResponseEntity>> deleteVehicle(String vehicleId) {
    return vehicleRepository.deleteVehicle(vehicleId);
  }
}


