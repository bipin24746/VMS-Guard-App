import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/data/data_sources/auth_data_sources.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/login_entity/auth_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/auth_repository.dart';


@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failure, AuthResponseEntity>> performAuth({
    required String phoneNumber,
  }) async {
    try {
      // Calling the data source and returning the response as a Right() (success)
      final response = await authDataSource.performAuth(phoneNo: phoneNumber);
      return Right(response);
    } catch (e) {
      // If an error occurs, catch it and map it to a Failure type.
      if (e is DioException) {
        // If the error is from Dio, we create a Failure from DioException.
        return Left(ServerFailure(e.response?.data['message'] ?? 'Unknown error'));
      }
      // Catch other exceptions and return them as failures.
      return Left(ServerFailure(e.toString()));
    }
  }
}
