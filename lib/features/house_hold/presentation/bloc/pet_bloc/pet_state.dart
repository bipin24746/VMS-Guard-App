part of 'pet_bloc.dart';

abstract class PetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PetInitial extends PetState {}

class PetLoading extends PetState {}

class PetSuccess extends PetState {
  final String message;
  PetSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class PetEditSuccess extends PetState {
  final String message;
  PetEditSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class PetFetchSuccess extends PetState {
  final List<PetEntity> pet;

  PetFetchSuccess(this.pet);

  @override
  List<Object?> get props => [pet];
}

class PetDeleteSuccess extends PetState {
  final List<PetEntity> pet;

  PetDeleteSuccess(this.pet);

  @override
  List<Object?> get props => [pet];
}

class PetFailure extends PetState {
  final String error;
  PetFailure(this.error);

  @override
  List<Object?> get props => [error];
}
