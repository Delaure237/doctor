part of 'my_doctor_bloc.dart';



abstract class MyDoctorEvent extends Equatable {
  const MyDoctorEvent();

  @override
  List<Object?> get props => [];
}

class LoadDoctors extends MyDoctorEvent {}

class LoadMoreDoctors extends MyDoctorEvent {}

class LoadDoctor extends MyDoctorEvent {}