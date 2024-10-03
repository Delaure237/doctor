part of 'get_appt_bloc.dart';

abstract class GetApptEvent extends Equatable {
  const GetApptEvent();

  @override
  List<Object?> get props => [];
}

class LoadAppointments extends GetApptEvent {}

class AppointmentsUpdated extends GetApptEvent {
  final List<Appointment> appointments;

  const AppointmentsUpdated(this.appointments);

  @override
  List<Object?> get props => [appointments];
}
