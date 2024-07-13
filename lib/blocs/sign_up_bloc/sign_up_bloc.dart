import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;
  SignUpBloc( { required UserRepository userRepository}) : _userRepository = userRepository,  super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcess());
     try {
       MyUser user = await _userRepository.signUp(event.user, event.password);
     await _userRepository.setUserData(user);
    // await _userRepository.addProfilePicture(user,);
     emit(SignUpSuccess());
     } catch (e) {
       emit(SignUpFailure());
     }
    }
    );
    on<UploadImageRequired>((event, emit) async {
      emit(UploadImageInProgress());
      try {
        MyUser user = event.user;
        File imageFile = event.file;

        await _userRepository.addProfilePicture(user, imageFile);
        emit(UploadImageSuccess());
      } catch (e) {
        emit(UploadImageFailure());
      }
    });
  }
 
  }

