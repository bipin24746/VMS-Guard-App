part of 'current_flat_bloc.dart';

abstract class CurrentFlatState extends Equatable{
  const CurrentFlatState();
  @override
  List<Object?> get props => [];
}

class CurrentFlatInitial extends CurrentFlatState{}

class CurrentFlatLoading extends CurrentFlatState{}
class CurrentFlatLoaded extends CurrentFlatState{
  final CurrentFlatIntegration currentFlatIntegration;
  const CurrentFlatLoaded({required this.currentFlatIntegration});

  @override
  List<Object?> get props => [currentFlatIntegration];
}
class CurrentFlatError extends CurrentFlatState{
  final String message;
  const CurrentFlatError({required this.message});


  @override
  List<Object?> get props => [message];
}