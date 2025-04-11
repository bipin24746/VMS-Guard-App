import 'package:equatable/equatable.dart';

abstract class SqfLiteEvent extends Equatable {
  const SqfLiteEvent();

  @override
  List<Object?> get props => [];
}

class AddDataEvent extends SqfLiteEvent {
  final String name;
  final int age;

  const AddDataEvent({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}

class ReadDataEvent extends SqfLiteEvent {}

class DeleteDataEvent extends SqfLiteEvent {
  final int dataId;

  const DeleteDataEvent(this.dataId);

  @override
  List<Object?> get props => [dataId];
}

class UpdateDataEvent extends SqfLiteEvent {
  final int id;
  final String name;
  final int age;

  const UpdateDataEvent({required this.id, required this.name, required this.age});

  @override
  List<Object?> get props => [id, name, age];
}
