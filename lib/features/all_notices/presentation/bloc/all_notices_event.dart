part of 'all_notices_bloc.dart';

abstract class AllNoticeEvent extends Equatable{
  const AllNoticeEvent();
  @override
  List<Object?> get props => [];
}

class FetchAllNotices extends AllNoticeEvent{

}