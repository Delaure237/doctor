import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'my_user_event.dart';
part 'my_user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserLoading()) {
    on<LoadUser>(_onLoadUser);
  }

Future<void> _onLoadUser(LoadUser event, Emitter<UserState> emit) async {
  try {
    emit(UserLoading());

    final userId = FirebaseAuth.instance.currentUser!.uid;

    final user = await userRepository.getUserData(userId);

    if (user != null) {
      emit(UserLoaded(user));
    } else {
      emit(const UserError('User data not found'));
    }
    } catch (e) {
    emit(const UserError('Failed to load user data'));
  }
}

}