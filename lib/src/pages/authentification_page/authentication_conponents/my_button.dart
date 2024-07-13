
import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const MyButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: MediaQuery.of(context).size.width*0.5,
          height: KToolbarHeight,
          child: TextButton(
            onPressed:onTap,
            style: TextButton.styleFrom(
              elevation: 4.0,
              backgroundColor: primaryColor,
              foregroundColor: bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60)
              )
            ),

            child:Padding(
              padding: const  EdgeInsets.symmetric(horizontal:25,vertical: 2) ,
                child: Text(title,
                textAlign: TextAlign.center,
                style:GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: bgColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
                )
                ),
                        ) 
            ,),
    );
      
  }
}