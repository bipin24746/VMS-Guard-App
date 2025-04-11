import 'package:equatable/equatable.dart';

class OtpResponseEntity extends Equatable {
  const OtpResponseEntity({
    required this.success,
    required this.message,
    required this.otpData,
  });
  final bool success;
  final String message;
  final OtpDataEntity otpData;

  @override
  List<Object?> get props => [
        success,
        message,
        otpData,
      ];
}

class OtpDataEntity extends Equatable {
  const OtpDataEntity({
    required this.accessToken,
    required this.refreshToken,
  });
  final String accessToken;
  final String refreshToken;

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];
}
