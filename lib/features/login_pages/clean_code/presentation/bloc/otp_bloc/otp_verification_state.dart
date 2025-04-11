

part of 'otp_verification_bloc.dart';

abstract class OtpVerificationState extends Equatable{
  const OtpVerificationState();
}

class OtpVerificationInitial extends OtpVerificationState{
  @override
  List<Object?> get props => [];

}

class OtpVerificationLoadingState extends OtpVerificationState{
  @override
  List<Object?> get props => [];
}

class OtpVerificationErrorState extends OtpVerificationState{
  final String errorMessage;
  const  OtpVerificationErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class OtpVerificationSuccessState extends OtpVerificationState{
  final OtpResponseEntity otpResponse;

  const OtpVerificationSuccessState({required this.otpResponse});

  @override
  List<Object?> get props => [otpResponse];
}