import 'dart:developer';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/otp_entity/otp_entity.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/otp_entity/otp_response_entity.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/usecases/otp_use_case.dart';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';

@injectable
class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  final OtpUseCase otpUseCase;

  OtpVerificationBloc({
    required this.otpUseCase,
  }) : super(OtpVerificationInitial()) {
    on<OtpVerificationUserEvent>(_otpVerificationUserEvent);
  }

  FutureOr<void> _otpVerificationUserEvent(
    OtpVerificationUserEvent event,
    Emitter<OtpVerificationState> emit,
  ) async {
    emit(OtpVerificationLoadingState());
    final errors = <String, dynamic>{};

    if (errors.isEmpty) {
      final otpVerificationUser = await otpUseCase.call(
        OtpEntity(
          phoneNo: event.phoneNo,
          otp: event.otp,
          hash: event.hash,
          deviceId: event.deviceId,
          deviceType: event.deviceType,
          fcmToken: event.fcmToken,
        ),
      );

      await otpVerificationUser.fold((failure) {
        log('this is error state ############');
        emit(
          OtpVerificationErrorState(
            errorMessage: 'OTP verification failed: ${failure.message}',
          ),
        );
      }, (response) async {
        // Logging the complete mapped model
        log('Mapped Model: $response');

        // Check if OTP is valid (assuming `success` field in response indicates this)
        if (response.success) {
          log('OTP verification successful');

          // Access the tokens based on your model's structure
          final accessToken =
              response.otpData.accessToken; // <-- Adjusted this line
          final refreshToken =
              response.otpData.refreshToken; // <-- Adjusted this line

          // Log the accessToken
          log('accessToken: $accessToken');
          log('refreshToken: $refreshToken');

          // Save accessToken and refreshToken to SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('accessToken', accessToken);
          await prefs.setString('refreshToken', refreshToken);
          await prefs.setString('authToken', accessToken);
          final authtoken = prefs.getString('authToken');

          // Log the saved token
          log('Token saved: $accessToken');

          // Emit success state
          emit(
            OtpVerificationSuccessState(
              otpResponse: response,
            ),
          );
        } else {
          log('OTP verification failed: Invalid OTP');

          // Emit error state if OTP is invalid
          emit(
            OtpVerificationErrorState(
              errorMessage: 'Invalid OTP entered',
            ),
          );
        }
      });
    }
  }
}
