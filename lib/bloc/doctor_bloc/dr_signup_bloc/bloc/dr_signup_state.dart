part of 'dr_signup_bloc.dart';

sealed class DrSignupState extends Equatable {
  const DrSignupState();
  
  @override
  List<Object> get props => [];
}

final class DrSignupBlocInitial extends DrSignupState {}
class SignUpSuccess extends DrSignupState{}
class SignUpFailure extends DrSignupState{}
class SignUpProcess extends DrSignupState{}