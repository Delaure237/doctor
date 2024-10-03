part of 'my_doctor_bloc.dart';

abstract class MyDoctorState extends Equatable {
  const MyDoctorState();

  @override
  List<Object?> get props => [];
}

class MyDoctorInitial extends MyDoctorState {}

class MyDoctorLoading extends MyDoctorState {}

class MyDoctorLoaded extends MyDoctorState {
  final List<MyDoctor> doctors;


  const MyDoctorLoaded({
    required this.doctors,

  });

  @override
  List<Object?> get props => [doctors];
}

class MyDoctorNoMore extends MyDoctorState {}

class MyDoctorError extends MyDoctorState {
  final String message;

  const MyDoctorError(this.message);

  @override
  List<Object?> get props => [message];
}

class DoctorLoading extends MyDoctorState {}

class DoctorLoaded extends MyDoctorState {
  final MyDoctor doctor;

  const DoctorLoaded(this.doctor);

  @override
  List<Object> get props => [doctor];
}

class DoctorError extends MyDoctorState {
  final String message;

  const DoctorError(this.message);

  @override
  List<Object> get props => [message];
}
