part of 'pet_bloc.dart';

abstract class PetEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreatePetEvent extends PetEvent {
  final String type;
  final String name;
  final String gender;
  final String breed;
  final String age;
  final File? image;

  CreatePetEvent({
    required this.type,
    required this.name,
    required this.gender,
    required this.breed,
    required this.age,
    required this.image,
  });

  @override
  List<Object?> get props => [type, name, gender, breed, age, image];
}

class EditPetEvent extends PetEvent {
  final String id;
  final String typee;
  final String name;
  final String gender;
  final String breed;
  final String age;
  final File? image;

  EditPetEvent({
    required this.id,
    required this.typee,
    required this.name,
    required this.gender,
    required this.breed,
    required this.age,
    this.image,
  });

  @override
  List<Object?> get props => [id, typee, name, gender, breed, age, image];
}

class DeletePetEvent extends PetEvent {
  final String petId; // Or use the correct identifier type

  DeletePetEvent({required this.petId});
}

class FetchPetEvent extends PetEvent {}
