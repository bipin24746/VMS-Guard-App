import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/otp_entity/otp_response_entity.dart';

class OtpResponseModel extends OtpResponseEntity {
  const OtpResponseModel({
    required super.success,
    required super.message,
    required super.otpData,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      OtpResponseModel(
        success: json['success'] as bool,
        message: json['message'].toString(),
        otpData: OtpResponseDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      );
}

class OtpResponseDataModel extends OtpDataEntity {
  const OtpResponseDataModel({
    required super.accessToken,
    required super.refreshToken,
  });

  factory OtpResponseDataModel.fromJson(Map<String, dynamic> json) =>
      OtpResponseDataModel(
        accessToken: json['accessToken'] as String,
        refreshToken: json['refreshToken'] as String,
      );
}