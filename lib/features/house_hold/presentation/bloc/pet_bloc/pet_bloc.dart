import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/pet_entity.dart';
import 'package:dayonecontacts/features/house_hold/domain/use_case/add_pet_usecase.dart';
import 'package:dayonecontacts/features/house_hold/domain/use_case/delete_pet_usecase.dart';
import 'package:dayonecontacts/features/house_hold/domain/use_case/edit_pet_usecase.dart';
import 'package:dayonecontacts/features/house_hold/domain/use_case/fetch_pet_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'pet_event.dart';
part 'pet_state.dart';

@injectable
class PetBloc extends Bloc<PetEvent, PetState> {
  final AddPetUseCase addPetUseCase;
  final GetPetUseCase getPetUseCase;
  final DeletePetUseCase deletePetUseCase;
  final EditPetUseCase editPetUseCase;
  PetBloc(
    this.addPetUseCase,
    this.getPetUseCase,
    this.deletePetUseCase,
    this.editPetUseCase,
  ) : super(PetInitial()) {
    on<CreatePetEvent>((event, emit) async {
      emit(PetLoading());

      final result = await addPetUseCase.addPet(
        type: event.type,
        name: event.name,
        gender: event.gender,
        breed: event.breed,
        age: event.age,
        image: event.image,
      );

      result.fold((failure) => emit(PetFailure(failure.message)),
          (response) => emit(PetSuccess(response.message)));
    });
    on<EditPetEvent>((event, emit) async {
      emit(PetLoading());
      final result = await editPetUseCase.editPet(
        id: event.id,
        type: event.typee,
        name: event.name,
        gender: event.gender,
        breed: event.breed,
        age: event.age,
        image: event.image,
      );

      result.fold(
        (failure) => emit(PetFailure(failure.message)),
        (response) => emit(PetEditSuccess(response.message)),
      );
    });

    on<FetchPetEvent>((event, emit) async {
      emit(PetLoading());
      final result = await getPetUseCase.getPet();

      result.fold(
        (failure) => emit(PetFailure(failure.message)),
        (pet) {
          if (pet.isEmpty) {
            emit(PetFailure("No Pets found"));
          } else {
            emit(PetFetchSuccess(pet));
          }
        },
      );
    });

    on<DeletePetEvent>((event, emit) async {
      emit(PetLoading());
      final result = await deletePetUseCase.deletePet(event.petId);

      result.fold(
        (failure) => emit(PetFailure(failure.message)),
        (response) {
          add(FetchPetEvent());
          emit(PetSuccess(response.message));

        },
      );
    });
  }
}
