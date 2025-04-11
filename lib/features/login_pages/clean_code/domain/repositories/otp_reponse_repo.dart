import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/otp_entity/otp_response_entity.dart';


abstract class OtpResponseRepo{
  Future<Either<Failure,OtpResponseEntity>> verifyOtp({
    required String phoneNumber,
    required String otp,
    required String hash,
    required String fcmToken,
    required String deviceId,
    required String deviceType,
});
}