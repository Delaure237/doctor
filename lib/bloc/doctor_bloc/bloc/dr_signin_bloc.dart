import 'package:bloc/bloc.dart';

import 'package:doctor_repository/doctor_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'dr_signin_event.dart';
part 'dr_signin_state.dart';

class DrSignInBloc extends Bloc<DrSigninEvent, DrSigninState> {
    final DoctorRepository _doctorRepository;
  DrSignInBloc({required DoctorRepository doctorRepository}) :_doctorRepository = doctorRepository, super(DrSigninInitial()) {
   on<DrSignInRequired>(((event, emit) async  {
     emit(DrSignInProcess());
     try {
       await _doctorRepository.signIn(event.email,event.password);
       emit(DrSignInSucces());
     } on FirebaseException catch(e){
      emit(DrSignInFailure(message: e.code));
     }
     catch (e) {
       emit(const DrSignInFailure());
     }
   }));
   on<DrSignOutRequired>(((event, emit) async  {
     await _doctorRepository.logOut();
   }));
  }
}
