import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'localization_event.dart';
part 'localization_state.dart';

@injectable
class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState(locale: const Locale('en'))) {
    on<ChangeLanguageEvent>((event, emit) {
      emit(LocalizationState(locale: event.locale));
    });
  }
}
