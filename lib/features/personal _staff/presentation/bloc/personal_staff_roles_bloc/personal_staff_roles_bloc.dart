import 'package:bloc/bloc.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/entity/personal_staff_roles_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:dayonecontacts/features/personal%20_staff/domain/use_case/personal_staff_roles_use_case.dart';
import 'package:injectable/injectable.dart';

part 'personal_staff_roles_event.dart';
part 'personal_staff_roles_state.dart';

@injectable
class PersonalStaffRolesBloc
    extends Bloc<PersonalStaffRolesEvent, PersonalStaffRolesState> {
  final GetPersonalStaffRolesUseCase getPersonalStaffRolesUseCase;

  PersonalStaffRolesBloc(this.getPersonalStaffRolesUseCase)
      : super(PersonalStaffRolesInitial()) {
    on<FetchPersonalStaffRolesEvent>((event, emit) async {
      emit(PersonalStaffRolesLoading());

      final result = await getPersonalStaffRolesUseCase.getStaffRoles();

      result.fold(
            (failure) => emit(PersonalStaffRolesFailure(failure.message)),
            (personalStaffRoles) {
          if (personalStaffRoles.isEmpty) {
            emit(PersonalStaffRolesFailure("No Staff Roles Found"));
          } else {
            emit(PersonalStaffRolesFetchSuccess(personalStaffRoles));
          }
        },
      );
    });
  }
}
