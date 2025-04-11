part of 'notice_bloc.dart';

abstract class NoticeState extends Equatable {
  const NoticeState();

  @override
  List<Object?> get props => [];
}

class NoticeInitial extends NoticeState {}

class NoticeLoading extends NoticeState {}

class NoticeLoaded extends NoticeState {
  final Integration notices;

  const NoticeLoaded({required this.notices});

  @override
  List<Object?> get props => [notices];
}

class NoticeError extends NoticeState {
  final String message;

  const NoticeError({required this.message});

  @override
  List<Object?> get props => [message];
}