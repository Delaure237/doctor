
import 'dart:developer';

import 'package:appointment_repository/appointment_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';



part 'book_appt_event.dart';
part 'book_appt_state.dart';



class BookApptBloc extends Bloc<BookApptEvent, BookApptState> {
  final AppointmentRepository appointmentRepo;
  Appointment _appointment = Appointment.empty; // Utilisation de l'appointment vide comme point de départ

  BookApptBloc({required this.appointmentRepo}) : super(BookApptInitial()) {
    on<UpdateAppointmentInfo>(_onUpdateAppointmentInfo);
  }

  // Méthode qui gère la mise à jour des informations du rendez-vous
  Future<void> _onUpdateAppointmentInfo(
    UpdateAppointmentInfo event,
    Emitter<BookApptState> emit,
  ) async {
    emit(BookAppProcess());
    log('BookApptBloc: Processing appointment update');

    try {
      // Mise à jour des informations du rendez-vous à partir de l'événement reçu
      _appointment = event.appointment.copyWith();
      log('BookApptBloc: Updated appointment: $_appointment');

      // Appel du repository pour créer le rendez-vous
      await appointmentRepo.createAppointment(_appointment);
      log('BookApptBloc: Appointment successfully created');

      // Emission de l'état de succès une fois le rendez-vous créé
      emit(BookAppSuccess());
    } catch (error) {
      // Log de l'erreur et émission de l'état d'échec en cas d'erreur
      log('BookApptBloc: Failed to create appointment: $error');
      emit(BookAppFailure());
    }
  }
}
