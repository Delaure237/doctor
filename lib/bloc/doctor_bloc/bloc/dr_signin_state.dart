part of 'dr_signin_bloc.dart';

sealed class DrSigninState extends Equatable {
  const DrSigninState();
  
  @override
  List<Object> get props => [];
}

final class DrSigninInitial extends DrSigninState {}
class DrSignInSucces extends DrSigninState{}
class DrSignInFailure extends DrSigninState{
  final String? message;
  const DrSignInFailure({this.message});
}
class DrSignInProcess extends DrSigninState{}