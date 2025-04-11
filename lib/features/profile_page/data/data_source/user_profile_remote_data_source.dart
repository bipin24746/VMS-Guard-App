import 'dart:developer';
import 'package:dayonecontacts/core/constants/api_constants.dart';
import 'package:dayonecontacts/features/profile_page/data/model/user_profile_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserProfileRemoteDataSource {
  Future<UserProfileModel> getUserProfile();
  Future<String> communityConnect();
  Future<String> editUserInfo({
    required String id,
    required String name,
    required String gender,
    required String dob,
    required String bloodgroup,
  });
}

@LazySingleton(as: UserProfileRemoteDataSource)
class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  final Dio dio = Dio();
  final String urlProfile = ApiConstants().urlProfile;
  final String urlCommunity = ApiConstants().urlCommunity;
  final String urlUser = ApiConstants().urlUser;

  @override
  Future<UserProfileModel> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken == null) {
      throw Exception("Authorization token is missing");
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
    };

    try {
      final response = await dio.get(urlProfile);

      if (response.statusCode == 200 && response.data['success'] == true) {
        final userResponse = UserProfileModel.fromJson(response.data);
        log('User profile: $userResponse');
        return userResponse;
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception("Error fetching user profile: $e");
    }
  }

  @override
  Future<String> editUserInfo({
    required String id,
    required String name,
    required String gender,
    required String dob,
    required String bloodgroup,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    log("date of birth: $dob");

    if (authToken == null) {
      throw Exception("Authorization token is missing.");
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
    };

    try {
      // Creating FormData
      FormData formData = FormData.fromMap({
        'name': name,
        'dob': dob,
        'gender': gender,
        'bloodgroup': bloodgroup,
      });

      log("user verifieds");

      // Sending PUT request
      final response = await dio.put(urlUser, data: formData);
      log("Response: ${response.data}");

      // Check if status code is 404, indicating a possible endpoint issue
      if (response.statusCode == 404) {
        throw Exception('Error: The endpoint for updating user does not exist or the user ID is invalid.');
      }

      // Handling API response
      if (response.statusCode == 200 && response.data['success'] == true) {
        log("user verified");
        return response.data['message'];
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } on DioException catch (e) {
      log("DioError: ${e.message}");
      if (e.response != null) {
        log("Response data: ${e.response?.data}");
      }
      throw Exception('Error during profile editing: ${e.message}');
    } catch (e) {
      log("Error: $e");
      throw Exception('Error during profile editing: $e');
    }
  }

  @override
  Future<String> communityConnect() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final authToken = prefs.getString('authToken');

      if (authToken == null) {
        throw Exception("Authorization token is missing.");
      }

      dio.options.headers = {
        'Authorization': 'Bearer $authToken',
      };

      // Make the API request
      final response = await dio.post(urlCommunity);

      if (response.statusCode == 201) {
        log("Community connect success");
        return "Success"; // Return a success message
      } else {
        return "Failed with status code: ${response.statusCode}";
      }
    } catch (e) {
      return "Error: ${e.toString()}";
    }
  }
}
