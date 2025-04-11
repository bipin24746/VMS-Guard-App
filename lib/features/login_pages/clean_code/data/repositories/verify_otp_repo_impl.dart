import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/data/data_sources/verify_otp_data_source.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/data/models/otp_model/otp_response_model.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/repositories/otp_reponse_repo.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OtpResponseRepo)
class VerifyOtpRepoImpl extends OtpResponseRepo {
  final VerifyOtpDataSource verifyOtpDataSource;

  VerifyOtpRepoImpl({required this.verifyOtpDataSource});

  @override
  Future<Either<Failure, OtpResponseModel>> verifyOtp({
    required String phoneNumber,
    required String otp,
    required String hash,
    required String deviceType,
    required String deviceId,
    required String fcmToken,
  }) async {
    try {
      log('OTP verification request initiated.');

      final response = await verifyOtpDataSource.verifyOtp(
        phoneNo: phoneNumber,
        otp: otp,
        hash: hash,
        deviceType: deviceType,
        deviceId: deviceId,
        fcmToken: fcmToken,
      );

      log('OTP verification successful.');

      return Right(response); // Assuming response is of type OtpResponseEntity
    } on DioException catch (e) {
      log('OTP verification failed: ${e.toString()}');
      return Left(ServerFailure('Server Error: ${e.message}'));
    } catch (e) {
      log('OTP verification failed: ${e.toString()}');
      return Left(ServerFailure('Otp Verification Failed'));
    }
  }
}
