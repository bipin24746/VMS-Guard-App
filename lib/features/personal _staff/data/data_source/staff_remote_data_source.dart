import 'dart:developer';
import 'dart:io';

import 'package:dayonecontacts/core/constants/api_constants.dart';
import 'package:dayonecontacts/features/personal%20_staff/data/model/personal_staff_model.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonalStaffRemoteDataSource {
  Future<String> addStaff({
    required String name,
    required String contact,
    required String econtact,
    required String bloodGroup,
    required String gender,
    required String staffRoleId,
    required String citizenshipNo,
    required String dob,
    File? profile,
    File? citizenshipFrontImage,
    File? citizenshipBackImage,
  });
  Future<List<PersonalStaffEntity>> getPendingStaff();
}

@LazySingleton(as: PersonalStaffRemoteDataSource)
class PersonalStaffRemoteDataSourceImpl
    implements PersonalStaffRemoteDataSource {
  final Dio dio = Dio();
  final String addPersonalStaff = ApiConstants().addPersonalStaff;
  final String pendingPersonalStaff = ApiConstants().pendingPersonalStaff;

  @override
  Future<String> addStaff({
    required String name,
    required String contact,
    required String econtact,
    required String bloodGroup,
    required String gender,
    required String staffRoleId,
    required String citizenshipNo,
    required String dob,
    File? profile,
    File? citizenshipFrontImage,
    File? citizenshipBackImage,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    log("name: $name,dob:$dob, contact:$contact,econtact: $econtact, bloodGroup: $bloodGroup,gender:$gender,role:$staffRoleId,citizenshipNo:$citizenshipNo");

    if (authToken == null) {
      throw Exception("Authorization token is missing.");
    }

    dio.options.headers = {
      'Authorization': "Bearer $authToken",
    };

    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'contact': contact,
        'econtact': econtact,
        'bloodgroup': bloodGroup,
        'gender': gender,
        'staffRoleId': staffRoleId,
        'citizenshipNo': citizenshipNo,
        'dob': dob,
      });
      log("it is being");
      // Add profileImageUrl if it's not null
      if (profile != null) {
        formData.files.add(
          MapEntry(
            'profile',
            await MultipartFile.fromFile(
              profile.path,
              filename: profile.path.split('/').last,
              contentType: DioMediaType('profile', 'jpeg'), // Correct MIME type
            ),
          ),
        );
        log("profileImage added to request.");
      } else {
        log("No profileImage provided.");
      }

      // Add citizenshipFrontImageUrl if it's not null
      if (citizenshipFrontImage != null) {
        formData.files.add(
          MapEntry(
            'citizenshipFrontImage',
            await MultipartFile.fromFile(
              citizenshipFrontImage.path,
              filename: citizenshipFrontImage.path.split('/').last,
              contentType: DioMediaType(
                  'citizenshipFrontImage', 'jpeg'), // Correct MIME type
            ),
          ),
        );
        log("citizenshipFrontImage added to request.");
      } else {
        log("No citizenshipFrontImage provided.");
      }

      // Add citizenshipBackImageUrl if it's not null
      if (citizenshipBackImage != null) {
        formData.files.add(
          MapEntry(
            'citizenshipBackImage',
            await MultipartFile.fromFile(
              citizenshipBackImage.path,
              filename: citizenshipBackImage.path.split('/').last,
              contentType: DioMediaType(
                  'citizenshipBackImage', 'jpeg'), // Correct MIME type
            ),
          ),
        );
        log("citizenshipBackImageUrl added to request.");
      } else {
        log("No citizenshipBackImageUrl provided.");
      }

      // Send the request
      final response = await dio.post(addPersonalStaff, data: formData);
      log("Response: ${response.data}");

      // Check the response status
      if (response.statusCode == 201 && response.data['success'] == true) {
        log("successfully added staff");
        return response.data['message'];
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } on DioError catch (e) {
      log("DioError: ${e.message}");
      if (e.response != null) {
        log("Response data: ${e.response?.data}");
      }
      throw Exception('Error during Staff creation: ${e.message}');
    } catch (e) {
      log("Error: $e");
      throw Exception('Error during Staff creation: $e');
    }
  }

  @override
  Future<List<PersonalStaffEntity>> getPendingStaff() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken == null) {
      throw Exception("Authorization token is missing");
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
    };

    try {
      final response = await dio.get(pendingPersonalStaff);
      log('API Response: ${response.data}');

      if (response.statusCode == 200 && response.data['success'] == true) {
        final listResponse = List<PersonalStaffEntity>.from(
            (response.data['data'] as List? ?? [])
                .map((x) => PersonalStaffModel.fromJson(x)));
        log('response $listResponse');
        return listResponse;
      } else {
        throw Exception('Failed to fetch pending staff.');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception("Error Fetching Pending List: $e");
    }
  }

}
