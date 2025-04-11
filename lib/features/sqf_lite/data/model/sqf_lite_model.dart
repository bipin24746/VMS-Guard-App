import 'package:dayonecontacts/features/sqf_lite/domain/entity/sqf_lite_entity.dart';

class SqfLiteModel extends SqfLiteEntity {
  const SqfLiteModel({super.id, required super.name, required super.age});

  factory SqfLiteModel.fromMap(Map<String, dynamic> map) {
    return SqfLiteModel(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
