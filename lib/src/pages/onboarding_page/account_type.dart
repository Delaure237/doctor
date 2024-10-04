import 'package:doctor/bloc/account_type/bloc/account_type_bloc.dart';
import 'package:doctor/dr_app_view.dart';
import 'package:doctor/src/pages/onboarding_page/components/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../patient_app_view.dart';
import '../shared/constant/constant.dart';

class AccountType extends StatefulWidget {
  const AccountType({super.key});

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  @override
  void initState() {
    super.initState();
    // Charger l'état initial du bloc si nécessaire
    //context.read<AccountTypeBloc>().add(LoadAccountEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AccountTypeBloc, AccountTypeState>(
        listener: (context, state) {
          // Logique de traitement des erreurs ou d'autres changements d'état, si nécessaire
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        child: BlocBuilder<AccountTypeBloc, AccountTypeState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "TheSpecialist",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 24,
                            fontFamily: "arial-bold",
                          ),
                        ),
                        const SizedBox(height: 3.0),
                        Text(
                          "Choose an Account Type",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        const Text(
                          """
                           By clicking on get started you agree to our privacy policy and terms of use, please take the time to read this article carefully to understand how we collect, use, and protect your personal information.
                        """,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            inherit: true,
                            wordSpacing: 0.7,
                            height: 1,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                        // Option pour le compte patient avec radio button
                        SelectableContainerWithRadio(
                          isSelected: state.selectedAccount == TypeOfAccount.patient,
                          onTap: () {
                            context.read<AccountTypeBloc>().add(const SelectedAccountEvent(TypeOfAccount.patient));
                          },
                          imagePath: "lib/asset/images/patient_icon_140554.png",
                          text: "Patient Account",
                          value: TypeOfAccount.patient,
                          groupValue: state.selectedAccount,
                        ),
                        const SizedBox(height: 12),

                        // Option pour le compte docteur avec radio button
                        SelectableContainerWithRadio(
                          isSelected: state.selectedAccount == TypeOfAccount.doctor,
                          onTap: () {
                            context.read<AccountTypeBloc>().add(const SelectedAccountEvent(TypeOfAccount.doctor));
                          },
                          imagePath: "lib/asset/images/doc.png",
                          text: "Doctor Account",
                          value: TypeOfAccount.doctor,
                          groupValue: state.selectedAccount,
                        ),
                      ],
                    ),
                    NextButton(
                      title: "Get Started",
                      onPressed: () async {
                        final selectedAccount = state.selectedAccount;
                        if (selectedAccount != TypeOfAccount.unknow) {
                          // Gestion de la navigation basée sur l'état sélectionné
                          if (selectedAccount == TypeOfAccount.doctor) {
                            await Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => const MyDrAppView()),
                              (Route<dynamic> route) => false,
                            );
                          } else if (selectedAccount == TypeOfAccount.patient) {
                            await Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => const MyPaAppView()),
                              (Route<dynamic> route) => false,
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select an account type"),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Nouveau widget avec Radio
class SelectableContainerWithRadio extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String imagePath;
  final String text;
  final TypeOfAccount value;
  final TypeOfAccount groupValue;

  const SelectableContainerWithRadio({
    required this.isSelected,
    required this.onTap,
    required this.imagePath,
    required this.text,
    required this.value,
    required this.groupValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected ? [BoxShadow(color: primaryColor.withOpacity(0.2), blurRadius: 10)] : [],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Radio<TypeOfAccount>(
              value: value,
              groupValue: groupValue,
              onChanged: (newValue) => onTap(),
              activeColor: primaryColor,
            ),
            const SizedBox(width: 16),
            Image.asset(
              imagePath,
              height: 48,
              width: 48,
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
