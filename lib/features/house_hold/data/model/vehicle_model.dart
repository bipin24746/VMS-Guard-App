import 'package:dayonecontacts/features/house_hold/domain/entity/vehicle_entity.dart';

class VehicleModel extends VehicleEntity {
  const VehicleModel({
    required String id,
    required String type,
    required String name,
    required String noplate,
    String? imageUrl,
  }) : super(
    id: id,
    type: type,
    name: name,
    noplate: noplate,
    imageUrl: imageUrl,
  );

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      name: json['name'] as String? ?? '',
      noplate: json['noplate'] as String? ?? '',
      imageUrl: json['image']?['url'] as String?,
    );
  }
}

