part of 'vehicle_bloc.dart';

abstract class VehicleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VehicleInitital extends VehicleState {}

class VehicleLoading extends VehicleState {}

class VehicleSuccess extends VehicleState {
  final String message;
  VehicleSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class VehicleEditSuccess extends VehicleState {
  final String message;
  VehicleEditSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class VehicleFetchedSuccess extends VehicleState {
  final List<VehicleEntity> vehicles;

  VehicleFetchedSuccess(this.vehicles);
  @override
  List<Object?> get props => [vehicles];
}

class VehicleDeleteSuccess extends VehicleState {
  final List<VehicleEntity> vehicles;

  VehicleDeleteSuccess(this.vehicles);

  @override
  List<Object?> get props => [vehicles];
}

class VehicleFailure extends VehicleState {
  final String error;
  VehicleFailure(this.error);

  @override
  List<Object?> get props => [error];
}
