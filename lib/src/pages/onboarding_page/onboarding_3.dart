// ignore_for_file: camel_case_types, avoid_print

import 'package:doctor/blocs/account_type/bloc/account_type_bloc.dart';
import 'package:doctor/src/pages/onboarding_page/account_type.dart';
import 'package:doctor/src/pages/onboarding_page/widgets/onboarding_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Onboarding_3 extends StatelessWidget {
  
  const Onboarding_3({super.key, });

  @override
  Widget build(BuildContext context) {
    return OnBoardingCard(
      path: 'lib/asset/images/La-teleconsultation-comment-ca-marche.jpg',
      desc: 'book your appointment',
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> BlocProvider<AccountTypeBloc>(
            create: (context) => AccountTypeBloc(),
            child: const AccountType()
          )
          
          ));
          print("Account type choose page");
      },
      title: "GetStarted",
      
    );
  }
}
