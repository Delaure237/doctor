import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared_between_pages/constant/constant.dart';

class NextButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const NextButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: KToolbarHeight,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              elevation: 4.0,
              
              backgroundColor: primaryColor,
              foregroundColor: bgColor,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60))),
          child: Text(
            title,
            style:GoogleFonts.poppins(
              textStyle:const TextStyle(
                fontSize: 18,
              )
            )
          )),
    );
  }
}
