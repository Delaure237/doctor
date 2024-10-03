part of 'my_user_bloc.dart';


// Événements du Bloc
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {}

// États du Bloc
