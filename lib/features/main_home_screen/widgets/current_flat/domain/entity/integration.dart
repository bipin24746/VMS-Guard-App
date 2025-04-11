import 'package:equatable/equatable.dart';
// Block class
class Block {
  final String id;
  final String name;
  final Apartment apartment;

  // Constructor accepts named parameters
  Block({required this.id, required this.name, required this.apartment});
}


// Floor class
class Floor {
  final String id;
  final String name;
  final Block block;

  // Constructor accepts named parameters
  Floor({required this.id, required this.name, required this.block});
}

// Apartment model
class Apartment {
  final String id;
  final String name;
  final String area;
  final String city;

  // Constructor accepts named parameters
  Apartment({required this.id, required this.name, required this.area, required this.city});
}


class Data extends Equatable {
  final String name;
  final String id;
  final Floor floor; // The floor is an object, not a String.

  const Data({
    required this.name,
    required this.id,
    required this.floor,
  });

  @override
  List<Object?> get props => [name, id, floor];
}

class CurrentFlatIntegration extends Equatable {
  final bool success;
  final Data data;

  const CurrentFlatIntegration({
    required this.success,
    required this.data,
  });

  @override
  List<Object?> get props => [success, data];
}
