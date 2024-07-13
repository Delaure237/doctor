part of 'doctor_auth_bloc.dart';

sealed class DoctorAuthBlocEvent extends Equatable {
  const DoctorAuthBlocEvent();

  @override
  List<Object> get props => [];
}
class AuthenticationDrChanged extends DoctorAuthBlocEvent{
  final User? doctor;
  const AuthenticationDrChanged(this.doctor);
}
