part of 'vehicle_bloc.dart';

abstract class VehicleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateVehicleEvent extends VehicleEvent {
  final String type;
  final String name;
  final String noplate;
  final File? image;

  CreateVehicleEvent({
    required this.type,
    required this.name,
    required this.noplate,
    this.image,
  });

  @override
  List<Object?> get props => [type, name, noplate, image];
}

class EditVehicleEvent extends VehicleEvent {
  final String id;
  final String type;
  final String name;
  final String noplate;
  final File? image;
  final String? existingImageUrl;

  EditVehicleEvent({
    required this.id,
    required this.type,
    required this.name,
    required this.noplate,
    this.image,
    this.existingImageUrl,
  });

  @override
  List<Object?> get props => [type, name, noplate, image, id];
}

class DeleteVehicleEvent extends VehicleEvent {
  final String vehicleId;

  DeleteVehicleEvent({required this.vehicleId});
}

class FetchVehiclesEvent extends VehicleEvent {}
