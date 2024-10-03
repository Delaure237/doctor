part of 'book_appt_bloc.dart';

sealed class BookApptEvent extends Equatable {
  const BookApptEvent();

  @override
  List<Object> get props => [];
}
class UpdateAppointmentInfo extends BookApptEvent{
  final Appointment appointment;
  const UpdateAppointmentInfo(this.appointment);
  @override
  List<Object> get props => [appointment];
}