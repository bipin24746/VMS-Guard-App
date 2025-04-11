import 'dart:developer';
import 'package:dayonecontacts/core/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/otp_model/otp_response_model.dart';

abstract class VerifyOtpDataSource {
  Future<OtpResponseModel> verifyOtp({
    required String phoneNo,
    required String otp,
    required String hash,
    required String deviceId,
    required String deviceType,
    required String fcmToken,
  });
}

@LazySingleton(as: VerifyOtpDataSource)

class VerifyOtpDataSourceImpl implements VerifyOtpDataSource {
  final Dio dio;
  final String verifyOtpUrl = ApiConstants().verifyOtpUrl;
  // Define the API URL directly as a constant
  // static const String _verifyOtpUrl = 'https://housing-stagingserver.aitc.ai/api/v1/client/otp/verify';

  VerifyOtpDataSourceImpl({required this.dio});

  @override
  Future<OtpResponseModel> verifyOtp({
    required String phoneNo,
    required String otp,
    required String hash,
    required String deviceId,
    required String deviceType,
    required String fcmToken,
  }) async {
    try {
      log('------------phoneNo: $phoneNo');
      log('------------otp: $otp');
      log('------------hash: $hash');
      log('------------deviceId: $deviceId');
      log('------------fcmToken: $fcmToken');
      log('------------deviceType: $deviceType');

      final response = await dio.post(
        verifyOtpUrl,
        data: {
          'phone': phoneNo,
          'otp': otp,
          'hash': hash,
          'deviceId': deviceId,
          'fcmToken': fcmToken,
          'deviceType': deviceType,
        },
      );

      if (response.data != null && response.data is Map<String, dynamic>) {
        return OtpResponseModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Invalid response format from server');
      }
    } catch (e) {
      log('OTP verification failed: ${e.toString()}');
      throw Exception('OTP verification failed: ${e.toString()}');
    }
  }
}
