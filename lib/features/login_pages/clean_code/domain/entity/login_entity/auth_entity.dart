import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable{
  final String phoneNo;
  const AuthEntity({
    required this.phoneNo
});

  @override
  List<Object?> get props => [phoneNo];
}