import 'dart:developer';
import 'dart:io';

import 'package:dayonecontacts/core/constants/api_constants.dart';
import 'package:dayonecontacts/features/house_hold/data/model/vehicle_model.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/vehicle_entity.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class VehicleRemoteDataSource {
  Future<String> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  });

  Future<String> editVehicle({
    required String id,
    required String type,
    required String name,
    required String noplate,
    File? image,
  });

  Future<List<VehicleEntity>> getVehicles();

  Future<String> deleteVehicle(String vehicleId);
}

@LazySingleton(as: VehicleRemoteDataSource)
class VehicleRemoteDataSourceImpl implements VehicleRemoteDataSource {
  final Dio dio = Dio();
  final String vehicleurl = ApiConstants().vehicleurl;
  // final String url =
  //     'https://housing-stagingserver.aitc.ai/api/v1/client/vehicle'; // API URL

  @override
  Future<String> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken == null) {
      throw Exception("Authorization token is missing.");
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
    };

    try {
      FormData formData = FormData.fromMap({
        'type': type,
        'name': name,
        'noplate': noplate,
      });
      log('image path ${image!.path}');
      // Add image to form data if it's provided
      formData.files.add(
        MapEntry(
          "file",
          await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
            contentType:
                DioMediaType('image', 'jpeg'), // Ensure correct mime type
          ),
        ),
      );

      final response = await dio.post(vehicleurl, data: formData);

      // Handle response
      if (response.statusCode == 201 && response.data['success'] == true) {
        return response.data['message'];
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log("Error during vehicle creation: $e");
      throw Exception("Error during vehicle creation: $e");
    }
  }

  @override
  Future<String> editVehicle({
    required String id,
    required String type,
    required String name,
    required String noplate,
    File? image,
    String? existingImageUrl, // Accept the old image URL
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken == null) {
      throw Exception("Authorization token is missing.");
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
    };

    try {
      FormData formData = FormData.fromMap({
        'type': type,
        'name': name,
        'noplate': noplate,
        if (image == null && existingImageUrl != null)
          'imageUrl': existingImageUrl,
      });

      // Only add a new image if selected
      if (image != null) {
        log('Uploading new image: ${image.path}');

        formData.files.add(
          MapEntry(
            "file",
            await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
              contentType: MediaType('image', 'jpeg'),
            ),
          ),
        );
      } else {
        log("No new image provided. Retrieving old image: $existingImageUrl");
      }

      final response = await dio.put('$vehicleurl/$id', data: formData);

      if (response.statusCode == 200 && response.data['success'] == true) {
        log('Vehicle updated successfully: ${response.data['message']}');
        return response.data['message'];
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception("Error during vehicle editing: $e");
    }
  }

  @override
  Future<List<VehicleEntity>> getVehicles() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken == null) {
      throw Exception("Authorization token is missing.");
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
    };

    try {
      final response = await dio.get(vehicleurl);
      log("API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        final listResponse = List<VehicleEntity>.from(
            (response.data['data'] as List? ?? [])
                .map((x) => VehicleModel.fromJson(x)));
        log(' response $listResponse');
        return listResponse;
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception("Error fetching vehicles: $e");
    }
  }

  @override
  Future<String> deleteVehicle(String vehicleId) async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken == null) {
      throw Exception("Authorization token is missing.");
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
    };

    try {
      final response = await dio
          .delete('$vehicleurl/$vehicleId'); // Assuming the endpoint is `vehicle/{id}`

      if (response.statusCode == 200 && response.data['success'] == true) {
        log("Vehicle with ID $vehicleId deleted successfully");
        return response.data['message'];
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log("Error during vehicle deletion: $e");
      throw Exception("Error during vehicle deletion: $e");
    }
  }
}
