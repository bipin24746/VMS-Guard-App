
part of 'otp_verification_bloc.dart';

abstract class OtpVerificationEvent extends Equatable {
  const OtpVerificationEvent();
}

class OtpVerificationUserEvent extends OtpVerificationEvent {
  const OtpVerificationUserEvent({
    required this.phoneNo,
    required this.otp,
    required this.hash,
    required this.fcmToken,
    required this.deviceId,
    required this.deviceType,
  });

  final String phoneNo;
  final String otp;
  final String hash;

  final String deviceType;
  final String deviceId;
  final String fcmToken;

  @override
  List<Object> get props => [
        phoneNo,
        hash,
        otp,
        deviceId,
        deviceType,
        fcmToken,
      ];
}
