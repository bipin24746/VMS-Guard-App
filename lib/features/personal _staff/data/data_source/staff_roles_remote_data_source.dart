import 'dart:developer';

import 'package:dayonecontacts/core/constants/api_constants.dart';
import 'package:dayonecontacts/features/personal%20_staff/data/model/personal_staff_roles_model.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_roles_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonalStaffRolesRemoteDataSource{
  Future<List<PersonalStaffRolesEntity>> getStaffRoles();
}

@LazySingleton(as: PersonalStaffRolesRemoteDataSource)
class PersonalStaffRolesDataSourceImpl implements PersonalStaffRolesRemoteDataSource{
  final Dio dio = Dio();
  final String addPersonalStaffRoles = ApiConstants().addPersonalStaffRoles;

  @override
  Future<List<PersonalStaffRolesEntity>> getStaffRoles() async{
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if(authToken == null){
      throw Exception("Authorization token is missing");
    }
    dio.options.headers = {
      'Authorization' : 'Bearer $authToken',
    };
    try{
      final response = await dio.get(addPersonalStaffRoles);
      if (response.statusCode == 200 && response.data['success'] == true) {
        final listResponse = List<PersonalStaffRolesEntity>.from(
            (response.data['data'] as List? ?? [])
                .map((x) => PersonalStaffRoleModel.fromJson(x)));
        log(' response $listResponse');
        return listResponse;
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception("Error fetching Pets: $e");

    }
}
}