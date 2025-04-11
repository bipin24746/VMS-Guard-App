import 'package:bloc/bloc.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/entity/sqf_lite_entity.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/use_case/delete_data_use_case.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/use_case/insert_data_use_case.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/use_case/read_data_use_case.dart';
import 'package:dayonecontacts/features/sqf_lite/domain/use_case/update_data_use_case.dart';
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_event.dart';
import 'package:dayonecontacts/features/sqf_lite/presentation/bloc/sqf_lite_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SqfLiteBloc extends Bloc<SqfLiteEvent, SqfLiteState> {
  final SqfAddDataUseCase addDataUseCase;
  final SqfUpdateDataUseCase updateDataUseCase;
  final SqfDeleteDataUsecase deleteDataUseCase;
  final SqfReadDataUseCase readDataUseCase;

  SqfLiteBloc(
      this.addDataUseCase,
      this.updateDataUseCase,
      this.deleteDataUseCase,
      this.readDataUseCase,
      ) : super(SqfLiteInitial()) {

    on<AddDataEvent>((event, emit) async {
      emit(SqfLiteLoading());
      try {
        final result = await addDataUseCase(SqfLiteEntity(
          name: event.name,
          age: event.age,
        ));
        emit(SqfLiteSuccess("Data inserted successfully"));
        add(ReadDataEvent()); // Refresh list after insert
      } catch (e) {
        emit(SqfLiteFailure(e.toString()));
      }
    });

    on<UpdateDataEvent>((event, emit) async {
      emit(SqfLiteLoading());
      try {
        final result = await updateDataUseCase(SqfLiteEntity(
          id: event.id,
          name: event.name,
          age: event.age,
        ));
        emit(SqfLiteSuccess("Data updated successfully"));
        add(ReadDataEvent()); // Refresh list after update
      } catch (e) {
        emit(SqfLiteFailure(e.toString()));
      }
    });

    on<ReadDataEvent>((event, emit) async {
      emit(SqfLiteLoading());
      try {
        final result = await readDataUseCase();
        if (result.isEmpty) {
          emit(SqfLiteFailure("No data found"));
        } else {
          emit(SqfLiteFetchSuccess(result));
        }
      } catch (e) {
        emit(SqfLiteFailure(e.toString()));
      }
    });

    on<DeleteDataEvent>((event, emit) async {
      emit(SqfLiteLoading());
      try {
        final result = await deleteDataUseCase(event.dataId);
        emit(SqfLiteSuccess("Data deleted successfully"));
        add(ReadDataEvent()); // Refresh list after delete
      } catch (e) {
        emit(SqfLiteFailure(e.toString()));
      }
    });
  }
}
