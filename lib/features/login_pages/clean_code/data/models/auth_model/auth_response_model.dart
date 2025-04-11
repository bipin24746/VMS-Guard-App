import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/login_entity/auth_response_entity.dart';

class AuthResponseModel extends AuthResponseEntity {

  AuthResponseModel({
    required bool success,
    required String message,
    AuthResponseDataModel? authResponseDataModel,
  }) : super(
    message: message,
    success: success,
    authResponseDataEntity: authResponseDataModel,
  );

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        success: json['success'] as bool,
        message: json['message'].toString(),
        authResponseDataModel: AuthResponseDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      );
}

class AuthResponseDataModel extends AuthResponseDataEntity {
  const AuthResponseDataModel({
    required super.phone,
    required super.otp,
    required super.hash,
  });

  factory AuthResponseDataModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseDataModel(
        phone: json['phone'] as String? ?? '',
        hash: json['hash'] as String? ?? '',
        otp: json['otp'] as String? ?? '',
      );
}




