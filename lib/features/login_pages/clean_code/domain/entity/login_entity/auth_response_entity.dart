import 'package:equatable/equatable.dart';

class AuthResponseEntity extends Equatable{
  final bool success;
  final String message;
  final AuthResponseDataEntity? authResponseDataEntity;

  const AuthResponseEntity({required this.success,required this.message,required this.authResponseDataEntity});

  @override
  List<Object?> get props => [success,message,authResponseDataEntity];

}

class AuthResponseDataEntity extends Equatable{
  final String hash;
  final String phone;
  final String otp;

  const AuthResponseDataEntity({required this.hash,required this.phone,required this.otp});

  @override
  List<Object?> get props => [hash,phone,otp];


}