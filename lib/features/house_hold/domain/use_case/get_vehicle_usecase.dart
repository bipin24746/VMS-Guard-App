import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/vehicle_entity.dart';
import 'package:dayonecontacts/features/house_hold/domain/repository/vehicle_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetVehicleUseCase {
  final VehicleRepository vehicleRepository;

  GetVehicleUseCase(this.vehicleRepository);

  Future<Either<Failure, List<VehicleEntity>>> getVehicles() {
    return vehicleRepository.getVehicles();
  }
}
