import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/constant/constant.dart';

class MyTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final VoidCallback? onTap;
  final String? errorMsg;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool readOnly;

  const MyTextForm({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.suffixIcon,
    required this.keyboardType,
    this.onTap,
    this.errorMsg,
    this.focusNode,
    this.onChanged,
    this.validator,
    required this.labelText,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller, 
      obscureText: obscureText,
      readOnly: readOnly, 
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      onTap: onTap,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      
      decoration: InputDecoration(
           enabledBorder: const UnderlineInputBorder(
           
            borderSide: BorderSide(color: Colors.black,width: 2),
          ),
         
           focusedBorder: const UnderlineInputBorder(
           
            borderSide: BorderSide(color: primaryColor),
          ),
        labelStyle:  Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: Colors.black,fontSize: 14),
        border: const UnderlineInputBorder(),
        labelText: '$labelText *', 
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(),
        suffixIcon: suffixIcon,
        errorText: errorMsg,
      ),
    );
  }
}
