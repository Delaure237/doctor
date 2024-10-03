part of 'dr_signin_bloc.dart';

sealed class DrSigninEvent extends Equatable {
  const DrSigninEvent();

  @override
  List<Object> get props => [];
}
class DrSignInRequired extends DrSigninEvent{
  final String email;
  final String password;

  const DrSignInRequired(this.email,this.password);
}
class DrSignOutRequired extends DrSigninEvent{
  const DrSignOutRequired();
}