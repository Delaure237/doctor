


import 'package:doctor/blocs/account_type/bloc/account_type_bloc.dart';
import 'package:doctor/src/pages/onboarding_page/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared_between_pages/constant/constant.dart';

class AccountType extends StatefulWidget {
  const AccountType({super.key});

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  @override
  Widget build(BuildContext context) {
    
    TypeOfAccount ? role =TypeOfAccount.unknow;
    return Scaffold(body: BlocBuilder<AccountTypeBloc, AccountTypeState>(
      builder: (context, state) {
        return SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        const Text(
                          "TheSpecialist",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 24,
                              fontFamily: "arial-bold"),
                        ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          "Choose and Account Type",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        const Text(
                          """
                           By clicking on get started you agree to our privacy policy and terms of use, please take the time to read this article carefully to understand how we collect,use and protect your personnal information
                      """,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              inherit: true,
                              wordSpacing: 0.7,
                              height: 1,
                              textBaseline: TextBaseline.alphabetic),
                          /*style: GoogleFonts.poppins(
                             textStyle: const TextStyle(
                              
                                fontSize: 12,
                                ),
                      ),*/
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "lib/asset/images/patient_icon_140554.png",
                              height: 48,
                              width: 48,
                            ),
                            Expanded(
                              child: RadioListTile<TypeOfAccount>(
                                
                                  title: Text("Patient Account",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )),
                                  value: TypeOfAccount.patient,
                                  groupValue: role,
                                  onChanged: (TypeOfAccount? value) {
                                    setState(() {
                                      role=value;
                                    });
                                  }),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "lib/asset/images/doc.png",
                              height: 48,
                              width: 48,
                            ),
                            Expanded(
                              child: RadioListTile<TypeOfAccount>(
                                toggleable:true ,
                                  title: Text("Doctor Account",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )),
                                  value: TypeOfAccount.doctor,
                                  groupValue: role,
                                  onChanged: (TypeOfAccount? value){
                                       setState(() {
                                         role=value;
                                       });
                                  }),
                            )
                          ],
                        ),
                      ]),
                       NextButton(title: "Get Started", onPressed: () {
                        if(role == TypeOfAccount.unknow){
                          ScaffoldMessenger.of(context).showSnackBar(
                              const  SnackBar(content: Text("please select and account type"))
                          );
                        } else {
                          context.read<AccountTypeBloc>().add(SelectedAccountEvent(role!));
                        }
                        
                        context.read<AccountTypeBloc>().add(  SelectedAccountEvent(role!));
                        },)
                    ])));
      },
    ));
  }
}
