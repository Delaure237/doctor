part of 'get_appt_bloc.dart';

abstract class GetApptState extends Equatable {
  const GetApptState();

  @override
  List<Object> get props => [];
}

class GetAppLoading extends GetApptState {}
class GetApptEmpty extends GetApptState {}
class GetApptLoaded extends GetApptState {
  final List<Appointment> appointments;

  const GetApptLoaded({required this.appointments});

  @override
  List<Object> get props => [appointments];
}

class GetAppError extends GetApptState {
  final String error;

  const GetAppError({required this.error});

  @override
  List<Object> get props => [error];
}
