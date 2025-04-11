import 'package:equatable/equatable.dart';

class PetEntity extends Equatable{
  const PetEntity({
    required this.id,
    required this.typee,
    required this.name,
    required this.gender,
    required this.breed,
    required this.age,
    this.imageUrl,
});
  final String id;
  final String typee;
  final String name;
  final String gender;
  final String breed;
  final String age;
  final String? imageUrl;

  @override
  List<Object?> get props => [id,name,typee,gender,breed,age,imageUrl];
}