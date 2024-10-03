// ignore_for_file: use_build_context_synchronously

import 'package:doctor/src/pages/shared/widgets/slide_transition.dart';
import 'package:doctor/storage_services/doctor_data_shp.dart';
import 'package:flutter/material.dart';
import 'package:doctor/src/pages/auth/authentication_conponents/my_button.dart';
import 'package:doctor/src/pages/auth/doctor_auth/conponents/my_text_field.dart';
import 'package:doctor/src/pages/auth/doctor_auth/conponents/sign_up/job_info.dart';

import '../../../../shared/constant/constant.dart';


class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  String? _errorMsg;
  final TextEditingController dateofBirthController= TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

 /* @override
  void dispose() {
    dateofBirthController.dispose();
    firstNameController.dispose();
    nameController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 70),
                      const Text(
                        "TheSpecialist",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 24,
                          fontFamily: "arial-bold",
                        ),
                      ),
                   //   const Subtitle(sub: "Add your personal information"),
                          Text("Add your personnal inforlmation",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),),
                      const SizedBox(height: 30),
                      MyTextForm(
                        controller: firstNameController,
                        hintText: "First Name",
                        obscureText: false,
                        errorMsg: _errorMsg,
                        keyboardType: TextInputType.name,
                        labelText: "First Name",
                        readOnly: false,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill this field";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 26),
                      MyTextForm(
                        controller: nameController,
                        hintText: "Name",
                        errorMsg: _errorMsg,
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        labelText: "Name",
                        readOnly: false,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill this field";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 26),
                      MyTextForm(
                        errorMsg: _errorMsg,
                        controller: dateofBirthController,
                        hintText: "date of birth",
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        labelText: "date of birth",
                        readOnly: false,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill this field";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      MyButton(
                        title: "Next",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await StorageService.setString('firstname', firstNameController.text);
                            await StorageService.setString('name', nameController.text);
                            await StorageService.setString('Dob', dateofBirthController.text);
                                
                            Navigator.push( context,  SlideTransition1(const WorkInfo()),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
