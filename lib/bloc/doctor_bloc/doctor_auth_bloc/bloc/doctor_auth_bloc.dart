import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'doctor_auth_bloc_event.dart';
part 'doctor_auth_bloc_state.dart';

class DoctorAuthBlocBloc extends Bloc<DoctorAuthBlocEvent, DoctorAuthBlocState> {
 final DoctorRepository doctorRepository;
  late final StreamSubscription<User?> doctorSubscription;
  DoctorAuthBlocBloc({  required  this.doctorRepository}
) : super( const DoctorAuthBlocState.unknow()) {
      // print("drAuthBLOC bloc");
      doctorSubscription = doctorRepository.doctor.listen((doctor) {
        add(AuthenticationDrChanged(doctor));
       });
     
     on<AuthenticationDrChanged>((event,emit){
       if(event.doctor == null){
        emit(const DoctorAuthBlocState.unauthenticated());
       } else {
         emit(DoctorAuthBlocState.authenticated(event.doctor!));  
        
       }
});
  }
  @override 
  Future<void> close() {
    doctorSubscription.cancel();
    return super.close();
  }
}
