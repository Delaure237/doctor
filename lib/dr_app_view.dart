
import 'package:doctor/DrAuthenticate.dart';
import 'package:doctor/blocs/doctor_bloc/bloc/dr_signin_bloc.dart';
import 'package:doctor/blocs/doctor_bloc/doctor_auth_bloc/bloc/doctor_auth_bloc.dart';

import 'package:doctor/src/pages/homepage/homepage_conponent/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrAppView extends StatelessWidget {
  const MyDrAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAuthBlocBloc,DoctorAuthBlocState>
      (
        builder: (context,state){
          if(state.status ==  DrAuthenticationStatus.authenticated){
            return BlocProvider(
              create: (context) => DrSignInBloc(
                doctorRepository: context.read<DoctorAuthBlocBloc>().doctorRepository),
                child: const ExploreBar(),
              );
          } else {
            return const Scaffold(
                 body: DrAuthentication()
            );
         
          }
        }
      
        );
  }
}
    