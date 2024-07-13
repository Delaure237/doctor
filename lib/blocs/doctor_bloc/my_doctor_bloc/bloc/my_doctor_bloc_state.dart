part of 'my_doctor_bloc_bloc.dart';

sealed class MyDoctorBlocState extends Equatable {
  const MyDoctorBlocState();
  
  @override
  List<Object> get props => [];
}

final class MyDoctorBlocInitial extends MyDoctorBlocState {}
