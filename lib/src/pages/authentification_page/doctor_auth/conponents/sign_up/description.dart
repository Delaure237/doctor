// ignore_for_file: unused_field

import 'package:doctor/src/pages/authentification_page/authentication_conponents/my_button.dart';

import 'package:doctor/src/pages/authentification_page/doctor_auth/conponents/sign_up/sign_up.dart';
import 'package:doctor/src/pages/shared_between_pages/widgets/subtitle.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:flutter/material.dart';

import '../../../../shared_between_pages/constant/constant.dart';


class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  final TextEditingController descriptionController = TextEditingController();
  String? _errorMsg ;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:const  EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 70,),
                     const Text("TheSpecialist",style: TextStyle(color: primaryColor,fontSize: 24,fontFamily: "arial-bold"),),
                    //const SizedBox(height: 24,),
                   const  Subtitle(sub: "Tell Us about yoursel"),
                    const  SizedBox(height: 24,),
                      TextFormField(
                        controller: descriptionController,
                        maxLines: 7,
                        validator: (val){
                          if (val!.isEmpty) {
                            return "fill this field";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Tell us about yourself",
                          helperText: "Give a desciption of yourself and professional experience",
                          labelText: "About Me",
                          
                        ),
                      ),
              
                         const  SizedBox(height: 30,),
                        MyButton(title: "Continuer", onTap: (){
                           if (_formKey.currentState!.validate()) {
                            MyDoctor myDoctor = MyDoctor.empty;
                            myDoctor = myDoctor.copyWith(
                              about: descriptionController.text,
                            
                            );
                              Navigator.push(context, MaterialPageRoute(builder:   (context) =>const DoctorSignUp()));
                           }
                        }
                        )      
                        

                ],
              ),
            ),
          )
        )
      )
    )
    )
          );
  }
}