import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'my_doctor_event.dart';
part 'my_doctor_state.dart';

class MyDoctorBloc extends Bloc<MyDoctorEvent, MyDoctorState> {
  final DoctorRepository _doctorRepository;
  StreamSubscription<List<MyDoctor>>? _doctorSubscription;

  MyDoctorBloc(this._doctorRepository) : super(MyDoctorInitial()) {
    on<LoadDoctors>(_onLoadDoctors);
    on<LoadDoctor>(_onLoadDoctor);
  }
Future<void> _onLoadDoctors(LoadDoctors event, Emitter<MyDoctorState> emit) async {
  emit(MyDoctorLoading());

  // Annulez l'abonnement précédent
  await _doctorSubscription?.cancel();

  try {
    // Écoute du flux de médecins
    await for (final doctors in _doctorRepository.fetchAllDoctorsStream()) {
      emit(MyDoctorLoaded(doctors: doctors));
    }
  } catch (error) {
    emit(MyDoctorError("Error: $error"));
  }
}

  

  Future<void> _onLoadDoctor(LoadDoctor event, Emitter<MyDoctorState> emit) async {
    try {
      emit(DoctorLoading());

      final doctorId = FirebaseAuth.instance.currentUser!.uid;
      final doctor = await _doctorRepository.geDoctorData(doctorId);

      if (doctor != null) {
        emit(DoctorLoaded(doctor));
      } else {
        emit(const DoctorError('User data not found'));
      }
    } catch (e) {
      emit(const DoctorError('Failed to load user data'));
    }
  }

  @override
  Future<void> close() {
    // Annuler toute souscription active
    _doctorSubscription?.cancel();
    return super.close();
  }
}
