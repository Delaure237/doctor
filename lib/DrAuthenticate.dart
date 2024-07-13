// ignore_for_file: file_names


import 'package:doctor/blocs/doctor_bloc/bloc/dr_signin_bloc.dart';
import 'package:doctor/blocs/doctor_bloc/doctor_auth_bloc/bloc/doctor_auth_bloc.dart';
import 'package:doctor/blocs/doctor_bloc/dr_signup_bloc/bloc/dr_signup_bloc.dart';
import 'package:doctor/src/pages/authentification_page/doctor_auth/conponents/sign_up/sign_up.dart';
import 'package:doctor/src/pages/authentification_page/doctor_auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrAuthentication extends StatefulWidget {
  const DrAuthentication({super.key});

  @override
  State<DrAuthentication> createState() => _DrAuthenticationState();
}

class _DrAuthenticationState extends State<DrAuthentication> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return BlocProvider<DrSignInBloc>(
        create: (context) => DrSignInBloc(
            doctorRepository:
                context.read<DoctorAuthBlocBloc>().doctorRepository),
        child: const DrSignInPage(
          
        ),
      );
    } else {
      return BlocProvider(
        create: (context) => DrSignupBloc(doctorRepository: context.read<DoctorAuthBlocBloc>().doctorRepository),
        child: const DoctorSignUp()
      );
    }
  }
}
