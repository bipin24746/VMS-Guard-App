import 'dart:developer';
import 'package:dayonecontacts/core/constants/api_constants.dart';
import 'package:dayonecontacts/core/constants/shared_prefs_const.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_flat/data/models/current_flat_integration_models.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class CurrentFlatRemoteDataSource {
  Future<CurrentFlatIntegrationModel> getDataFlat();
}

@LazySingleton(as: CurrentFlatRemoteDataSource)
class CurrentFlatRemoteDataSourceimpl implements CurrentFlatRemoteDataSource {
  final Dio dio;
  final String currentFlatEndPoint = ApiConstants().currentFlatEndPoint;
  CurrentFlatRemoteDataSourceimpl(this.dio);

  Future<CurrentFlatIntegrationModel> getDataFlat() async {
    try {


      final token = await SharedPrefs.getAuthTokens();
      if (token == null) {
        throw Exception('Authentication token not found');
      }

      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(
        currentFlatEndPoint,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        log('Data from flats: $data');

        return CurrentFlatIntegrationModel.fromJson(data);
      } else {
        throw Exception('Failed to load flats: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching flat data: $e');
      throw Exception('Failed to load flats');
    }
  }
}
