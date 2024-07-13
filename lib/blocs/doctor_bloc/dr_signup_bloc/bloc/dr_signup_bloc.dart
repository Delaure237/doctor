import 'package:bloc/bloc.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:equatable/equatable.dart';

part 'dr_signup_event.dart';
part 'dr_signup_state.dart';

class DrSignupBloc extends Bloc<DrSignupEvent, DrSignupState> {
 final DoctorRepository _doctorRepository;
  DrSignupBloc({required DoctorRepository doctorRepository}) : _doctorRepository = doctorRepository,super(DrSignupBlocInitial()) {
      on<DrSignUpRequired>((event, emit) async {
      emit(SignUpProcess());
     try {
       MyDoctor doctor = await _doctorRepository.signUp(event.doctor, event.password);
     await _doctorRepository.setUserData(doctor);
     emit(SignUpSuccess());
     } catch (e) {
       emit(SignUpFailure());
     }
    });
  }
}
  

