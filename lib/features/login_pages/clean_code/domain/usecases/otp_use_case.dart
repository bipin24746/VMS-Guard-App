import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/core/usecases/use_cases.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/otp_entity/otp_entity.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/otp_entity/otp_response_entity.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/repositories/otp_reponse_repo.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class OtpUseCase implements UseCase<OtpResponseEntity, OtpEntity> {
  final OtpResponseRepo otpResponseRepo;
  const OtpUseCase({required this.otpResponseRepo});

  @override
  Future<Either<Failure, OtpResponseEntity>> call(OtpEntity params) async {
    return otpResponseRepo.verifyOtp(
      phoneNumber: params.phoneNo,
      otp: params.otp,
      hash: params.hash,
      deviceId: params.deviceId,
      deviceType: params.deviceType,
      fcmToken: params.fcmToken,
    );
  }
}
