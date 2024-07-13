import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class OnBoardingCard extends StatelessWidget {
 
  final String path;
  final String title;
  final String desc;
  final Function() onPressed;

  const OnBoardingCard({
    super.key,
    required this.path,
    required this.desc,
    required this.onPressed,
    required this.title,
   
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Image.asset(path, fit: BoxFit.cover),
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
              Colors.transparent,
              primaryColor.withOpacity(0.9),
              primaryColor,
            ])),
             child: Padding(
             padding: const EdgeInsets.all(8.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             
              Text(
                title,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: bgColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                desc,
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: bgColor,
                    fontSize: 14,
                    wordSpacing: 0.2,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                height: KToolbarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                        elevation: 4.0,
                        backgroundColor: bgColor,
                        foregroundColor: bgColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Padding(
                         padding:const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                         child: Text("Next",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(
                         textStyle: const TextStyle(
                         color: primaryColor,
                        fontSize: 18,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      )
    ]));
  }
}
