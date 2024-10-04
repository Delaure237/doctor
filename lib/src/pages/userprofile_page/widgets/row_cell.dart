import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfilField extends StatelessWidget {
  final IconData leading;
  final Function()? onTap;
  final String title;
  final Widget? trailing;
  const ProfilField({super.key, required this.leading, required this.title, this.trailing,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
        onTap;
      },
      child: ListTile(
         leading: CircleAvatar(
          backgroundColor: secondaryColor ,
          child: Icon(leading,color: bgColor,)),
         title: Text(title,
         style: GoogleFonts.poppins(
          textStyle:const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
          )
         ),),
         trailing:trailing,
      ),
    );
  }
}