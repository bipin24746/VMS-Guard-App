import 'package:equatable/equatable.dart';

class SqfLiteEntity extends Equatable {
  const SqfLiteEntity({this.id, required this.name, required this.age});
  final int? id;
  final String name;
  final int age;

  @override
  List<Object?> get props => [id, name, age];
}
