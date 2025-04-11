import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/login_entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.phoneNo,
    // required super.countryCode,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    phoneNo: json['phoneNo'].toString(),
    // countryCode: json["countryCode"] as int,
  );

  // Map<String, dynamic> toJson() => {
  //   'phone_number': int.tryParse(phoneNo),
  //   // "country_code": countryCode,
  // };
}
