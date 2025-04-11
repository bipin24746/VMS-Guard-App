import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/all_notices/domain/entities/all_notice_integration.dart';
import 'package:dayonecontacts/features/all_notices/domain/usecase/get_all_notices_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'all_notices_event.dart';
part 'all_notices_state.dart';

@injectable
class AllNoticeBloc extends Bloc<AllNoticeEvent,AllNoticeState>{
  final GetAllNoticesUsecase getAllNotices;

  AllNoticeBloc({required this.getAllNotices}) : super(AllNoticeInitial()){
    on<FetchAllNotices>(_onFetchAllNotices);
  }

  void _onFetchAllNotices(FetchAllNotices event, Emitter<AllNoticeState> emit) async{
    emit(AllNoticeLoading());
    final Either<Failure,AllNoticesIntegration> result = await getAllNotices();

    result.fold(
          (failure) => emit(AllNoticeError(message: failure.toString())),
          (allNoticesCleans) => emit(AllNoticeLoaded(allNoticesCleans: allNoticesCleans)),
    );
  }
}