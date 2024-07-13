
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyTextFormField extends StatelessWidget {
   final TextEditingController controller;
  final String hintText;
   final String labelText;
  final bool   obscureText;
 
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final VoidCallback? onTap;
  final String? errorMsg;
  final FocusNode? focusNode;
  final Function(String?)? onchanged;
  final String? Function(String?)? validator;
  @override
   MyTextFormField({super.key, required this.controller, required this.hintText, required this.obscureText, this.suffixIcon, required this.keyboardType, this.onTap, this.errorMsg, this.focusNode, this.onchanged, this.validator, required this.labelText, required bool readOnly, });

  Text required = const Text(" * ",style: TextStyle(
    color: Colors.red,
  ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      obscureText: obscureText,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          labelStyle:  GoogleFonts.poppins(),
          border: const UnderlineInputBorder(
            
          ),
          label: Row(
            children: [
              Text(labelText),
              const Text("*",style: TextStyle(color: Colors.red),)
            ],
          ),
          //filled: true,
          hintText: hintText,
           hintStyle: GoogleFonts.poppins(),
         // labelText: "$labelText*"
        ),
    );
  }
}