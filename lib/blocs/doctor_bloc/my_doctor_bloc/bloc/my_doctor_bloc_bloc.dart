import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_doctor_bloc_event.dart';
part 'my_doctor_bloc_state.dart';

class MyDoctorBlocBloc extends Bloc<MyDoctorBlocEvent, MyDoctorBlocState> {
  MyDoctorBlocBloc() : super(MyDoctorBlocInitial()) {
    on<MyDoctorBlocEvent>((event, emit) {
      
    });
  }
}
