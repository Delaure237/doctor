// ignore_for_file: file_names

import 'package:doctor/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:doctor/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:doctor/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:doctor/src/pages/auth/sign_in_page/sign_in_screen.dart';
import 'package:doctor/src/pages/auth/sign_up_page/sign_up.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(
          userRepository: context.read<AuthenticationBloc>().userRepository,
         // googleSignIn: GoogleSignIn(), 
        ),
        child: SignInPage(
          toggleView: toggleView,
        ),
      );
    } else {
      return BlocProvider(
        create: (context) => SignUpBloc(
          userRepository: context.read<AuthenticationBloc>().userRepository,
        ),
        child: SignUpPage(
          toggleView: toggleView,
        ),
      );
    }
  }
}
