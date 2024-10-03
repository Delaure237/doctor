import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:equatable/equatable.dart';

part 'dr_signup_event.dart';
part 'dr_signup_state.dart';

class DrSignupBloc extends Bloc<DrSignupEvent, DrSignupState> {
  final DoctorRepository doctorRepository;
  MyDoctor doctor = MyDoctor.empty;

  DrSignupBloc({ required this.doctorRepository})
      : super(DrSignupBlocInitial()) {
    on<DrSignUpUpdatePersonalInfo>((event, emit) {
      doctor = doctor.copyWith(
        firstname: event.firstName,
        name: event.lastName,
        dob: event.dob,
      );
      log("Updated personal info: ${doctor.toString()}");
    });

    on<DrSignUpUpdateWorkInfo>((event, emit) {
      doctor = doctor.copyWith(
        speciality: event.speciality,
        place: event.place,
        experience: event.experience,
        //path: event.path, // Inclure le path si nécessaire
      );
      log("Updated work info: ${doctor.toString()}");
    });

    on<DrSignUpUpdateDescription>((event, emit) {
      doctor = doctor.copyWith(
        about: event.description,
      );
      log("Updated description: ${doctor.toString()}");
    });

    on<DrSignUpRequired>((event, emit) async {
      log("Received Doctor object in Bloc: ${event.doctor}");
      doctor = event.doctor;
   

      // Vérifiez que toutes les propriétés nécessaires sont présentes
      if (doctor.email.isEmpty || doctor.password.isEmpty) {
        log("Error: Missing email or password");
        emit(SignUpFailure());
        return;
      }

      emit(SignUpProcess());
      log("Email in Bloc: ${doctor.email}");
      log("Password in Bloc: ${event.password}");
      try {
        await doctorRepository.drSignUp(doctor, event.password);
      //  await doctorRepository.setUserData(doctor);
        emit(SignUpSuccess());
      } catch (e) {
        log("Error during sign up: $e");
        emit(SignUpFailure());
      }
    });
  }

  //MyDoctor get doctor => doctor; // Ajoutez ce getter
}
