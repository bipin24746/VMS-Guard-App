import 'dart:io';
import 'package:bloc/bloc.dart';

import 'package:dayonecontacts/features/house_hold/domain/entity/vehicle_entity.dart';
import 'package:dayonecontacts/features/house_hold/domain/use_case/add_vehicle_usecase.dart';
import 'package:dayonecontacts/features/house_hold/domain/use_case/delete_vehicle_usecase.dart';
import 'package:dayonecontacts/features/house_hold/domain/use_case/edit_vehicle_usecase.dart';
import 'package:dayonecontacts/features/house_hold/domain/use_case/get_vehicle_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

@injectable
class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final AddVehicleUseCase addVehicleUseCase;
  final GetVehicleUseCase getVehicleUseCase;
  final DeleteVehicleUseCase deleteVehicleUseCase;
  final EditVehicleUseCase editVehicleUseCase;

  VehicleBloc(
    this.addVehicleUseCase,
    this.getVehicleUseCase,
    this.deleteVehicleUseCase,
    this.editVehicleUseCase,
  ) : super(VehicleInitital()) {
    // Handling CreateVehicleEvent
    on<CreateVehicleEvent>((event, emit) async {
      emit(VehicleLoading());
      final result = await addVehicleUseCase.addVehicle(
        type: event.type,
        name: event.name,
        noplate: event.noplate,
        image: event.image,
      );

      result.fold(
        (failure) => emit(VehicleFailure(failure.message)),
        (response) => emit(VehicleSuccess(response.message)),
      );
    });

    on<EditVehicleEvent>((event, emit) async {
      emit(VehicleLoading());
      final result = await editVehicleUseCase.editVehicle(
        id: event.id,
        type: event.type,
        name: event.name,
        noplate: event.noplate,
        image: event.image,
      );

      result.fold(
        (failure) => emit(VehicleFailure(failure.message)),
        (response) => emit(VehicleEditSuccess(response.message)),
      );
    });

    on<DeleteVehicleEvent>((event, emit) async {
      emit(VehicleLoading());
      final result = await deleteVehicleUseCase.deleteVehicle(event.vehicleId);

      result.fold(
        (failure) => emit(VehicleFailure(failure.message)),
        (response) {
          add(FetchVehiclesEvent());
          emit(VehicleSuccess(response.message));

        },
      );
    });

    on<FetchVehiclesEvent>((event, emit) async {
      emit(VehicleLoading());
      final result = await getVehicleUseCase.getVehicles();

      result.fold(
        (failure) => emit(VehicleFailure(failure.message)),
        (vehicles) {
          if (vehicles.isEmpty) {
            emit(VehicleFailure("No vehicles found"));
          } else {
            emit(VehicleFetchedSuccess(vehicles));
          }
        },
      );
    });
  }
}
