import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/profile_page/data/data_source/user_profile_remote_data_source.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_entity/user_profile_entity.dart';
import 'package:dayonecontacts/features/profile_page/domain/user_profile_repository/user_profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource dataSource;
  UserProfileRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile() async {
    try {
      final userProfile = await dataSource.getUserProfile();
      return Right(userProfile);
    } catch (e) {
      return Left(ServerFailure("Failed to load user profile: $e"));
    }
  }

  @override
  Future<Either<Failure, BaseResponseEntity>> editUserInfo({
    required String id,
    required String name,
    required String gender,
    required String dob,
    required String bloodgroup,
  }) async {
    try {
      final result = await dataSource.editUserInfo(
        id: id,
        name: name,
        dob: dob,
        gender: gender,
        bloodgroup: bloodgroup,
      );
      return Right(BaseResponseModel(message: result)); // Ensure result is valid for BaseResponseModel
    } on DioError catch (e) {
      return Left(ServerFailure("Network error occurred: ${e.message}"));
    } on SocketException {
      return Left(ServerFailure("No internet connection"));
    } catch (e) {
      return Left(ServerFailure("Failed to edit profile: $e"));
    }
  }

  @override
  Future<Either<Failure, BaseResponseEntity>> communityConnect() async {
    try {
      final result = await dataSource.communityConnect();
      return Right(BaseResponseModel(message: result)); // Ensure result is valid for BaseResponseModel
    } catch (e) {
      // More specific error message to avoid exposing raw exception details
      return Left(ServerFailure("Failed to connect to the community: $e"));
    }
  }
}
