import 'package:dayonecontacts/features/house_hold/domain/entity/pet_entity.dart';

class PetModel extends PetEntity {
  const PetModel({
    required super.id,
    required super.typee,
    required super.name,
    required super.gender,
    required super.breed,
    required super.age,
    required super.imageUrl,
  });
  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'] as String? ?? '',
      typee: json['typee'] as String? ?? '',
      name: json['name'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      breed: json['breed'] as String? ?? '',
      age: json['age'] as String? ?? '',
      imageUrl: json['image'] != null ? json['image']['url'] as String? : '',
    );
  }
}
