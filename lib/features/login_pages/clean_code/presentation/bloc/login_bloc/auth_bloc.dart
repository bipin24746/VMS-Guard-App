import 'dart:developer';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/login_entity/auth_entity.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/login_entity/auth_response_entity.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/usecases/auth_usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;

  // Constructor with direct dependency injection
  AuthBloc(this.authUseCase) : super(AuthInitial()) {
    on<AuthUserEvent>(_authUserEvent);
  }

  FutureOr<void> _authUserEvent(
    AuthUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());

    final authUser = await authUseCase.call(
      AuthEntity(
        phoneNo: event.phoneNo,
        // countryCode: event.countryCode,  // Uncomment if you need to add country code
      ),
    );

    await authUser.fold((failure) {
      log('this is error state ############');
      // final error = failure as SignInFailure;
      emit(
        AuthErrorState(
            // errorMessage: error.signInError.message,
            errorMessage: 'error login'),
      );
    }, (r) async {
      log('Sign up response $r');

      emit(
        AuthSuccessState(
          authResponseEntity: r,
        ),
      );
    });
  }
}
