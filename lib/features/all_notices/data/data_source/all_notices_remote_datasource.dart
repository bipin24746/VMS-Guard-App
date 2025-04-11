import 'dart:developer';

import 'package:dayonecontacts/core/constants/shared_prefs_const.dart';
import 'package:dayonecontacts/core/constants/api_constants.dart';
import 'package:dayonecontacts/features/all_notices/data/models/all_notices_integration_models.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class AllNoticeRemoteDataSource {
  Future<AllNoticeIntegrationModel> getAllNotices();
}

@LazySingleton(as: AllNoticeRemoteDataSource)
class AllNoticeRemoteDataSourceimpl implements AllNoticeRemoteDataSource {
  final Dio dio;
  final String allnoticeEndpoint = ApiConstants().allnoticeEndpoint;
  AllNoticeRemoteDataSourceimpl(this.dio);

  Future<AllNoticeIntegrationModel> getAllNotices() async {
    final token = await SharedPrefs.getAuthTokens();

    if (token == null) {
      throw Exception('Authentication token not found');
    }
    try {
      final response = await dio.get(
        allnoticeEndpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data; // Dio handles response data parsing
        log("data from notices: $data");
        return AllNoticeIntegrationModel.fromJson(data);
      } else {
        throw Exception('Failed to load notices');
      }
    } catch (e) {
      throw Exception('Failed to load notices: $e');
    }
  }
}
