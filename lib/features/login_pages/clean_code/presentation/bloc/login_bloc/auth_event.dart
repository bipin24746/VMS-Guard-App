part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthUserEvent extends AuthEvent {
  final String phoneNo;
  const AuthUserEvent({required this.phoneNo});

  @override
  List<Object?> get props => [phoneNo];
}


