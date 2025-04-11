part of 'all_notices_bloc.dart';

abstract class AllNoticeState extends Equatable {
  const AllNoticeState();

  @override
  List<Object?> get props => [];
}

class AllNoticeInitial extends AllNoticeState {}

class AllNoticeLoading extends AllNoticeState {}

class AllNoticeLoaded extends AllNoticeState {
  final AllNoticesIntegration allNoticesCleans;

  const AllNoticeLoaded({required this.allNoticesCleans});

  @override
  List<Object?> get props => [allNoticesCleans];
}

class AllNoticeError extends AllNoticeState {
  final String message;

  const AllNoticeError({required this.message});

  @override
  List<Object?> get props => [message];
}
