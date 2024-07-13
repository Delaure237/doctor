
import 'package:doctor/src/pages/authentification_page/authentication_conponents/other_method_button.dart';
import 'package:doctor/src/pages/forgetpassword/forget_password.dart';
import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../authentication_conponents/my_textfield.dart';

class SignInPage extends StatefulWidget {
  final Function toggleView;
  const SignInPage({super.key, required this.toggleView});
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = true;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  bool isEnabled = false;
  String? _errorMsg;
  @override
  Widget build(BuildContext context) { 
    return BlocListener<SignInBloc, SignInState>(
              listener: (context, state) {
               if(state is SignInSucces){
                setState(() {
                  signInRequired = false;
                });
                Navigator.pop(context);
               }else if(state is SignInProcess){
                setState(() {
                  signInRequired = true;
                });
               } else if(state is SignInFailure){
                return;
               }
              },
              child: Form(
                key: _formKey,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "TheSpecialist",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 24,
                              fontFamily: "arial-bold"),
                        ),
                        const Text(
                          "Welcome back ,youv've been missed",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        MyTextField(
                          readOnly: false,
                          errorMsg: _errorMsg,
                          controller: emailController,
                          hintText: "Email",
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: const Icon(
                            CupertinoIcons.mail_solid,
                            color: primaryColor,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            } 
                            return null;
                            },
                        ),
                        
                        

                        const SizedBox(
                          height: 12,
                        ),

                        MyTextField(
                          readOnly: false,
                          errorMsg: _errorMsg,
                          controller: passwordController,
                          hintText: "Password",
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: primaryColor,
                          ),
                          obscureText: obscurePassword,
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                  if (obscurePassword) {
                                    iconPassword = CupertinoIcons.eye_fill;
                                  } else {
                                    iconPassword =
                                        CupertinoIcons.eye_slash_fill;
                                  }
                                });
                              },
                              icon: Icon(iconPassword)),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            } /*else if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')
                                .hasMatch(val)) {
                              return 'please enter a valid password';*/
                              return null;
                            }
                            
                          
                        ),

                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetPassword()));
                                },
                                child: const Text(
                                  "forgot password",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: "arial",
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ]),

                        const SizedBox(
                          height: 24,
                        ),
                         signInRequired?
                    
                           SizedBox(
          width: MediaQuery.of(context).size.width*0.5,
          height: KToolbarHeight,
          child: TextButton(
            onPressed:() { 
               if (_formKey.currentState!.validate()) {
                              context.read<SignInBloc>().add(
                                SignInRequired(emailController.text, passwordController.text));
                            }
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
                child: Text("Sign In",
                textAlign: TextAlign.center,
                style:  TextStyle(
                  color: bgColor,
                  fontSize: 18,
                  fontFamily: "arial-bold",
                ),
                ),
                        ) 
            ,),
    ):const CircularProgressIndicator(),

                        const SizedBox(
                          height: 20,
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Divider(
                                thickness: 2,
                                indent: 40,
                                endIndent: 5,
                              )),
                              Text("Or"),
                              Expanded(
                                  child: Divider(
                                thickness: 2,
                                indent: 5,
                                endIndent: 40,
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OtherMethodButton(
                            name: " Sign In with Google",
                            lead: SvgPicture.asset(
                                "lib/asset/images/icons8-google.svg",
                                width: 30,
                                height: 30),
                            onPressed: () {}),
                        const SizedBox(
                          height: 10,
                        ),

                        OtherMethodButton(
                            name: "  Sign In with Apple",
                            lead: SvgPicture.asset(
                              "lib/asset/images/icons8-mac-os.svg",
                              width: 30,
                              height: 30,
                            ),
                            onPressed: () {}),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?"),
                              const SizedBox(
                                width: 8,
                              ),
                              TextButton(
                                  onPressed: () {
                                    widget.toggleView();
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ])
                      ],
                    )),
              ),
            );
  
        
      
    
  }
}
