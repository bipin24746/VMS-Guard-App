import 'dart:developer';

import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/domain/entity/integration.dart';


class CurrentFlatIntegrationModel extends CurrentFlatIntegration {
  const CurrentFlatIntegrationModel({required bool success, required Data data})
      : super(success: success, data: data);

  factory CurrentFlatIntegrationModel.fromJson(Map<String, dynamic> json) {
    return CurrentFlatIntegrationModel(
      success: json["success"],
      data: DataModel.fromJson(json["data"]), // Handle nested data
    );
  }
}


class DataModel extends Data {
  const DataModel({required String id, required String name, required Floor floor})
      : super(id: id, name: name, floor: floor);

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json["name"],
      floor: json["floor"] != null
          ? FloorModel.fromJson(json["floor"]) // Convert JSON to FloorModel
          : FloorModel(id: '', name: 'Unknown Floor', block: BlockModel(id: '', name: '', apartment: ApartmentModel(id: '', name: '', area: '', city: ''))),
    );
  }
}


class FloorModel extends Floor {
  FloorModel({required String id, required String name, required Block block})
      : super(id: id, name: name, block: block);

  factory FloorModel.fromJson(Map<String, dynamic> json) {
    return FloorModel(
      id: json['id'],
      name: json['name'],
      block: json["block"] != null ? BlockModel.fromJson(json["block"]) : BlockModel(id: '', name: '', apartment: ApartmentModel(id: '', name: '', area: '', city: '')),
    );
  }
}


class BlockModel extends Block {
  BlockModel({required String id, required String name, required Apartment apartment})
      : super(id: id, name: name, apartment: apartment);

  factory BlockModel.fromJson(Map<String, dynamic> json) {
    return BlockModel(
      id: json['id'],
      name: json["name"],
      apartment: json["apartment"] != null
          ? ApartmentModel.fromJson(json["apartment"])
          : ApartmentModel(id: '', name: '', area: '', city: ''),
    );
  }
}


class ApartmentModel extends Apartment {
  ApartmentModel({required String id, required String name, required String area, required String city})
      : super(id: id, name: name, area: area, city: city);

  factory ApartmentModel.fromJson(Map<String, dynamic> json) {
    return ApartmentModel(
      id: json['id'],
      name: json["name"],
      area: json["area"],
      city: json["city"],
    );
  }
}

