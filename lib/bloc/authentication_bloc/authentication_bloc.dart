// auth_bloc.dart

import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  late final StreamSubscription<User?> _userSubscription;

  AuthenticationBloc({
    required this.userRepository,
  }) : super(const AuthenticationState.unknow()) {
    _userSubscription = userRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    });
    on<AuthenticationUserChanged>((event, emit) {
      if (event.user == null) {
        emit(const AuthenticationState.unauthenticated());
      } else {
        log('User ID: ${event.user!.uid}'); // Vérifiez que l'ID utilisateur est bien récupéré
        emit(AuthenticationState.authenticated(event.user!));
      }
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
