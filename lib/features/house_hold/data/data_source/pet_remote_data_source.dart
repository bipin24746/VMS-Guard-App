import 'dart:developer';
import 'dart:io';

import 'package:dayonecontacts/core/constants/api_constants.dart';
import 'package:dayonecontacts/features/house_hold/data/model/pet_model.dart';
import 'package:dayonecontacts/features/house_hold/domain/entity/pet_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PetRemoteDataSource {
  Future<String> addPet({
    required String type,
    required String name,
    required String gender,
    required String breed,
    required String age,
    File? image,
  });

  Future<String> editPet({
    required String id,
    required String type,
    required String name,
    required String gender,
    required String breed,
    required String age,
    File? image,
  });

  Future<List<PetEntity>> getPet();

  Future<String> deletePet(String petId);
}

@LazySingleton(as: PetRemoteDataSource)
class PetRemoteDataSourceImpl implements PetRemoteDataSource {
  final Dio dio = Dio();
  final String peturl = ApiConstants().peturl;
  // final String url = 'https://housing-stagingserver.aitc.ai/api/v1/client/pet';

  Future<String> addPet({
    required String type,
    required String name,
    required String gender,
    required String breed,
    required String age,
    File? image,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    log("Adding pet: type:$type, name:$name, gender:$gender, breed:$breed, age:$age");

    if (authToken == null) {
      throw Exception("Authorization token is missing.");
    }

    dio.options.headers = {
      'Authorization': "Bearer $authToken",
    };

    try {
      FormData formData = FormData.fromMap({
        'type': type,
        'name': name,
        'gender': gender,
        'breed': breed,
        'age': age,
        'image' :image,
      });

      // Add the image only if it's not null
      if (image != null) {
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
        log("Image added to request.");
      } else {
        log("No image provided.");
      }

      final response = await dio.post(peturl, data: formData);
      log("Response: ${response.data}");

      if (response.statusCode == 201 && response.data['success'] == true) {
        return response.data['message'];
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } on DioError catch (e) {
      log("DioError: ${e.message}");
      if (e.response != null) {
        log("Response data: ${e.response?.data}");
      }
      throw Exception('Error during pet creation: ${e.message}');
    } catch (e) {
      log("Error: $e");
      throw Exception('Error during pet creation: $e');
    }
  }


  @override
  Future<String> editPet({
    required String id,
    required String type,
    required String name,
    required String gender,
    required String breed,
    required String age,
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
      // Creating FormData
      FormData formData = FormData.fromMap({
        'type': type,
        'name': name,
        'gender': gender,
        'breed': breed,
        'age': age,
      });

      // Add image if available
      if (image != null) {
        formData.files.add(
          MapEntry(
            'file', // Ensure this matches API requirements
            await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
              contentType: DioMediaType('image', 'jpeg'), // Correct MediaType
            ),
          ),
        );
        log("Image added to request.");
      }

      // Sending PUT request
      final response = await dio.put('$peturl/$id', data: formData);
      log("Response: ${response.data}");

      // Handling API response
      if (response.statusCode == 200 && response.data['success'] == true) {
        return response.data['message'];
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } on DioException catch (e) {
      log("DioError: ${e.message}");
      if (e.response != null) {
        log("Response data: ${e.response?.data}");
      }
      throw Exception('Error during pet editing: ${e.message}');
    } catch (e) {
      log("Error: $e");
      throw Exception('Error during pet editing: $e');
    }
  }


  @override
  Future<List<PetEntity>> getPet() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken == null) {
      throw Exception("Authorization token is missing");
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
    };
    try {
      final response = await dio.get(peturl);
      log("API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        final listResponse = List<PetEntity>.from(
            (response.data['data'] as List? ?? [])
                .map((x) => PetModel.fromJson(x)));
        log(' response $listResponse');
        return listResponse;
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception("Error fetching Pets: $e");
    }
  }

  @override
  Future<String> deletePet(String petId) async{
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken == null) {
      throw Exception("Authorization token is missing.");
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
    };

    try {
      final response = await dio.delete('$peturl/$petId'); // Assuming the endpoint is `vehicle/{id}`

      if (response.statusCode == 200 && response.data['success'] == true) {
        log("Pet with ID $petId deleted successfully");
        return response.data['message'];
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log("Error during Pet deletion: $e");
      throw Exception("Error during Pet deletion: $e");
    }
  }

}
