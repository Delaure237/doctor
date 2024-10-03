/*import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor/src/pages/shared/constant/constant.dart';


import '../../../../bloc/sign_up_bloc/sign_up_bloc.dart'; // Assurez-vous d'importer le Bloc

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  // Déclarez un contrôleur pour chaque champ OTP
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is OtpVerificationSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('OTP validé avec succès !')),
              );
              // Rediriger vers la prochaine page
            } else if (state is OtpVerificationFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("TheSpecialist", style: TextStyle(color: primaryColor, fontSize: 24, fontFamily: "arial-bold")),
              const SizedBox(height: 50),
              Text(
                "Entrez le numéro OTP envoyé à l'email xxxxxxxxx@gmail.com",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildOtpField(context, _otpController1),
                    _buildOtpField(context, _otpController2),
                    _buildOtpField(context, _otpController3),
                    _buildOtpField(context, _otpController4),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  String otp = _otpController1.text +
                      _otpController2.text +
                      _otpController3.text +
                      _otpController4.text;

                  BlocProvider.of<SignUpBloc>(context).add(VerifyOtpEvent(otp: otp));
                },
                child: const Text("Vérifier OTP"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, TextEditingController controller) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus(); // Passer au champ suivant
          }
        },
        style: Theme.of(context).textTheme.headlineMedium,
        decoration: InputDecoration(
          focusColor: primaryColor,
          filled: true,
          fillColor: Colors.grey.shade200,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
*/