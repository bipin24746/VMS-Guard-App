import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/features/main_home_screen/widgets/current_notices/domain/use_case/get_notices_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/integration.dart';

part 'notice_event.dart';
part 'notice_state.dart';

@injectable
class NoticeBloc extends Bloc<NoticeEvent, NoticeState> {
  final GetNoticesUsecase getNotices;

  NoticeBloc({required this.getNotices}) : super(NoticeInitial()) {
    on<FetchNotices>(_onFetchNotices);
  }

  void _onFetchNotices(FetchNotices event, Emitter<NoticeState> emit) async {
    emit(NoticeLoading());
    final Either<Failure, Integration> result = await getNotices();

    result.fold(
          (failure) => emit(NoticeError(message: failure.toString())),
          (notices) => emit(NoticeLoaded(notices: notices)),
    );
  }
}