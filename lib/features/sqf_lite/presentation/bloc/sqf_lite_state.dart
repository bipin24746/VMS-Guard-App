import 'package:equatable/equatable.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/entity/sqf_lite_entity.dart';

abstract class SqfLiteState extends Equatable {
  const SqfLiteState();

  @override
  List<Object?> get props => [];
}

class SqfLiteInitial extends SqfLiteState {}

class SqfLiteLoading extends SqfLiteState {}

class SqfLiteFetchSuccess extends SqfLiteState {
  final List<SqfLiteEntity> data;

  const SqfLiteFetchSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class SqfLiteSuccess extends SqfLiteState {
  final String message;

  const SqfLiteSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class SqfLiteFailure extends SqfLiteState {
  final String error;

  const SqfLiteFailure(this.error);

  @override
  List<Object?> get props => [error];
}
