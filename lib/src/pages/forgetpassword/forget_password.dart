// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:doctor/src/pages/auth/authentication_conponents/my_textfield.dart';
import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:doctor/src/pages/shared/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
   String? _errorMsg;
   @override
   void dispose(){
    emailController.dispose();
    super.dispose();
   }
   Future passwordReset() async {
    try {
      
       await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      
       showDialog(context: context, builder: (context){
         return const AlertDialog(content:  Text("pasword reset link send! check your email"),);
        
       });
   
       Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
       print(e);
       showDialog(context: context, builder: (context){
         return AlertDialog(content:  Text(e.message.toString()),);
        
       }
       );
    }
   
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context, "Reset Password",[]),
      body: SafeArea(
        child: Column(
          children:[
                 const Text("Enter your email and we will send you a password reset link"),
                const  SizedBox(height: 24,),
                   MyTextField(
                          readOnly: false,
                          errorMsg: _errorMsg,
                          controller: emailController,
                          hintText: "Email",
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon:  const Icon(
                            CupertinoIcons.mail_solid,
                            color: primaryColor,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                                .hasMatch(val)) {
                              return 'please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24,),
                          SizedBox(
          width: MediaQuery.of(context).size.width*0.5,
          height: KToolbarHeight,
          child: TextButton(
            onPressed:() { 
             const ResetPassword();
            },
            style: TextButton.styleFrom(
              elevation: 4.0,
              backgroundColor: primaryColor,
              foregroundColor: bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60)
              )
            ),

            child:const Padding(
              padding:   EdgeInsets.symmetric(horizontal:25,vertical: 2) ,
                child: Text("Send Email",
                textAlign: TextAlign.center,
                style:  TextStyle(
                  color: bgColor,
                  fontSize: 18,
                  fontFamily: "arial-bold",
                ),
                ),
                        ) 
            ,),
                          )

          ]
        )
      ),
    );
  }
}