import 'dart:async';
import 'dart:developer';
import 'package:appointment_repository/appointment_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'get_appt_event.dart';
part 'get_appt_state.dart';

class GetApptBloc extends Bloc<GetApptEvent, GetApptState> {
  final AppointmentRepository appointmentRepository;
  final String userId;

  // Variable privée pour stocker le rôle
  String? _role;

  // Subscription pour le stream
  StreamSubscription<List<Appointment>>? _appointmentSubscription;

  GetApptBloc({
    required this.appointmentRepository,
    required this.userId,
  }) : super(GetAppLoading()) {
    on<LoadAppointments>(_onLoadAppointments);
    on<AppointmentsUpdated>(_onAppointmentsUpdated); // Ajout du gestionnaire pour AppointmentsUpdated
  }

  // Getter pour le rôle
  String? get role => _role;

  Future<void> _onLoadAppointments(
    LoadAppointments event,
    Emitter<GetApptState> emit,
  ) async {
    emit(GetAppLoading());

    try {
      // Charger le rôle et stocker dans la variable privée
      _role = await _getRoleFromPreferences();

      if (_role == 'patient') {
        _appointmentSubscription?.cancel();
        _appointmentSubscription = appointmentRepository
            .getAppointmentsForPatient(userId)
            .listen((appointments) {
          // Ajouter l'événement AppointmentsUpdated pour mettre à jour les rendez-vous
          add(AppointmentsUpdated(appointments));
        });
      } else if (_role == 'doctor') {
        _appointmentSubscription?.cancel();
        _appointmentSubscription = appointmentRepository
            .getAppointmentsForDoctor(userId)
            .listen((appointments) {
          // Ajouter l'événement AppointmentsUpdated pour mettre à jour les rendez-vous
          add(AppointmentsUpdated(appointments));
        });
      } else {
        // Gérer le cas où le rôle est inconnu
        emit(const GetAppError(error: "Rôle inconnu"));
        return;
      }
    } catch (e) {
      emit(GetAppError(error: e.toString()));
    }
  }

  // Gestionnaire pour l'événement AppointmentsUpdated
  void _onAppointmentsUpdated(
    AppointmentsUpdated event,
    Emitter<GetApptState> emit,
  ) {
    if (event.appointments.isNotEmpty) {
      emit(GetApptLoaded(appointments: event.appointments));
    } else {
      emit( GetApptEmpty()); // Si la liste des rendez-vous est vide
    }
  }

  Future<String> _getRoleFromPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final accountType = prefs.getString('account_type');
      log("Loaded accountType from SharedPreferences: $accountType");

      return accountType ?? 'unknown'; // Valeur par défaut
    } catch (e) {
      log("Error occurred: $e");
      return 'unknown'; // Valeur par défaut en cas d'erreur
    }
  }

  @override
  Future<void> close() {
    _appointmentSubscription?.cancel();
    return super.close();
  }
}
