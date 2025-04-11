import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_entity.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/use_case/pending_staff_use_case.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/use_case/personal_staff_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'personal_staff_event.dart';
part 'personal_staff_state.dart';

@injectable
class PersonalStaffBloc extends Bloc<PersonalStaffEvent, PersonalStaffState> {
  final AddPersonalStaffUseCase addPersonalStaffUseCase;
  final GetPendingStaffUsecase getPendingStaffUsecase;

  PersonalStaffBloc(this.addPersonalStaffUseCase, this.getPendingStaffUsecase)
      : super(PersonalStaffInitial()) {
    on<CreatePersonalStaffEvent>((event, emit) async {
      emit(PersonalStaffLoading());
      final result = await addPersonalStaffUseCase.addStaff(
        name: event.name,
        contact: event.contact,
        econtact: event.econtact,
        bloodGroup: event.bloodGroup,
        gender: event.gender,
        staffRoleId: event.staffRoleId,
        citizenshipNo: event.citizenshipNo,
        dob: event.dob,
        profile: event.profile,
        citizenshipFrontImage: event.citizenshipFrontImage,
        citizenshipBackImage: event.citizenshipBackImage,
      );

      result.fold(
        (failure) => emit(PersonalStaffFailure(failure.message)),
        (response) => emit(PersonalStaffSuccess(response.message)),
      );
    });

    on<FetchPendingStaffEvent>((event, emit) async {
      emit(PersonalStaffLoading());
      final result = await getPendingStaffUsecase.getPendingStaff();
      result.fold((failure) => emit(PersonalStaffFailure(failure.message)),
          (getPendingStaff) {
        if (getPendingStaff.isEmpty) {
          emit(PersonalStaffFailure("No Staff Failures"));
        } else {
          emit(PendingStaffFetchSuccess(getPendingStaff));
        }
      });
    });
  }
}
