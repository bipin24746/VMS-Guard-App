import 'package:equatable/equatable.dart';

class OtpEntity extends Equatable {
  const OtpEntity({
    required this.phoneNo,
    required this.otp,
    required this.hash,
    required this.deviceType,
    required this.deviceId,
    required this.fcmToken,
  });

  final String phoneNo;
  final String otp;
  final String hash;
  final String deviceId;
  final String fcmToken;
  final String deviceType;

  @override
  List<Object?> get props => [
        phoneNo,
        otp,
        hash,
        deviceId,
        deviceType,
        fcmToken,
      ];
}
