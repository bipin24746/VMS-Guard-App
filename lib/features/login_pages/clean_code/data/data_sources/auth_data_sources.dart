import 'dart:developer';

import 'package:dayonecontacts/core/constants/api_constants.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/data/models/auth_model/auth_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class AuthDataSource {
  Future<AuthResponseModel> performAuth({required String phoneNo});
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceimpl implements AuthDataSource {
  final Dio dio;
  final String authurl = ApiConstants().authurl;
  AuthDataSourceimpl({required this.dio});

  // Define the performAuth method
  @override
  Future<AuthResponseModel> performAuth({required String phoneNo}) async {
    try {
      final response = await dio.post(
        authurl, // The API endpoint for authentication
        data: {'contact': phoneNo}, // Pass necessary data (e.g., phone number)
      );

      // Handle the response from the API
      if (response.statusCode == 200) {
        log("its gone");
        // Parse and return the response as AuthResponseModel
        return AuthResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      log("eroroororor");
      throw Exception('Error during authentication:');
    }
  }
}
