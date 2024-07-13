import 'package:doctor/Authenticate.dart';
import 'package:doctor/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:doctor/blocs/sign_in_bloc/sign_in_bloc.dart';

import 'package:doctor/src/pages/homepage/homepage_conponent/nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPaAppView extends StatelessWidget {
  const MyPaAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                  BlocProvider(
              create: (context) => SignInBloc(
                userRepository: context.read<AuthenticationBloc>().userRepository,
              ),
                  )
              ], 
              child:const ExploreBar(),
                
        );
            
          } else {
            return Scaffold(
                body: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: const SafeArea(
                        child: SingleChildScrollView(
                      child: Center(child: Authentication()),
                    ))));
          }
        },
      
    );
  }
}
