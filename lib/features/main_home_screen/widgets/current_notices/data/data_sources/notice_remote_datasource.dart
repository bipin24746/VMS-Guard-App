import 'dart:convert';
import 'dart:developer';
import 'package:dayonecontacts/core/constants/api_constants.dart';
import 'package:dayonecontacts/core/constants/shared_prefs_const.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../models/integration_models.dart';

abstract class NoticeRemoteDataSource {
  Future<IntegrationModel> getNotices();
}

@LazySingleton(as: NoticeRemoteDataSource)
class NoticeRemoteDataSourceimpl implements NoticeRemoteDataSource {
  final Dio dio;
  final String noticeEndpoint = ApiConstants().noticeEndpoint;
  NoticeRemoteDataSourceimpl(this.dio);

  Future<IntegrationModel> getNotices() async {
    final token = await SharedPrefs.getAuthTokens();
    if (token == null) throw Exception('Authentication token not found');

    try {

      final response = await dio.get(
        noticeEndpoint,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        log("data from notices: ${response.data}");
        return IntegrationModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load notices');
      }
    } catch (e) {
      throw Exception('Failed to load notices: $e');
    }
  }
}
