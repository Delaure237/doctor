import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;
  MyUser _user = MyUser.empty;

  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcess());
      try {
        _user = await _userRepository.signUp(event.user, event.password);
        await _userRepository.setUserData(_user);
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure());
      }
    });

    // Ajoutez la gestion de la vérification de l'OTP
    
    on<VerifyOtpEvent>((event, emit) async {
      emit(SignUpProcess());
      try {
        // Vérifiez ici l'OTP, par exemple via l'API du backend ou autre logique.
        // Supposons que la validation soit réussie :
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }

  MyUser get user => _user;
}

