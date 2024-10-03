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
class DrSignUpUpdatePersonalInfo extends DrSignupEvent {
  final String firstName;
  final String lastName;
  final String dob;
  const DrSignUpUpdatePersonalInfo(this.firstName, this.lastName,this.dob);

  @override
  List<Object> get props => [firstName, lastName,dob];
}

class DrSignUpUpdateWorkInfo extends DrSignupEvent {
  final String speciality;
  final String place;
  final int experience;
 // final String path;

  const DrSignUpUpdateWorkInfo(this.speciality, this.place, this.experience);

  @override
  List<Object> get props => [speciality, place, experience];
}

class DrSignUpUpdateDescription extends DrSignupEvent {
  final String description;

  const DrSignUpUpdateDescription(this.description);

  @override
  List<Object> get props => [description];
}
