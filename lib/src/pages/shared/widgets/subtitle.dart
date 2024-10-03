import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Subtitle extends StatelessWidget {
  final String sub;
  const Subtitle({super.key, required this.sub});

  @override
  Widget build(BuildContext context) {
    return  Text(sub,style:  GoogleFonts.poppins(textStyle: const TextStyle(
      color: Colors.black,
      fontSize:22 ,
      fontWeight: FontWeight.w500,)
      ,
      )
      ,textAlign: TextAlign.justify,);
  }
}