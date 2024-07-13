part of 'dr_signup_bloc.dart';

sealed class DrSignupEvent extends Equatable {
  const DrSignupEvent();

  @override
  List<Object> get props => [];
}
class DrSignUpRequired extends DrSignupEvent{
  final MyDoctor doctor;
  final String password;
  const DrSignUpRequired(this.doctor, this.password);
}
