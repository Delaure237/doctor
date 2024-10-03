import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';



part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;


  SignInBloc({
    required UserRepository userRepository
    
  })  : _userRepository = userRepository,
      
        super(SignInInitial()) {
    
    // Gestion de la connexion classique par email/mot de passe
    on<SignInRequired>((event, emit) async {
      emit(SignInProcess());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(SignInSucces());
      } on FirebaseException catch (e) {
        emit(SignInFailure(message: e.code));
      } catch (e) {
        emit(const SignInFailure());
      }
    });

    // Gestion de la déconnexion
    on<SignOutRequired>((event, emit) async {
      await _userRepository.logOut();
    });

    // Gestion de la connexion via Google
   /* on<GoogleSignInRequired>((event, emit) async {
      emit(SignInProcess());
      try {
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          // Si l'utilisateur annule la connexion, on émet un état initial
          emit(SignInInitial());
        } else {
          final googleAuth = await googleUser.authentication;
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          await FirebaseAuth.instance.signInWithCredential(credential);
          emit(SignInSucces());
        }
      } on FirebaseException catch (e) {
        emit(SignInFailure(message: e.code));
      } catch (e) {
        emit(const SignInFailure());
      }
    });*/
  }
}
