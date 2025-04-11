import 'package:equatable/equatable.dart';

class VehicleEntity extends Equatable {
  // Constructor
  const VehicleEntity({
    required this.id,
    required this.type,
    required this.name,
    required this.noplate,
    this.imageUrl,
  });

  final String id;
  final String type;
  final String name;
  final String noplate;
  final String? imageUrl;

  @override
  List<Object?> get props => [
        id,
        type,
        name,
        noplate,
        imageUrl,
      ];
}
