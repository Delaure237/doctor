import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback? onTap; // Ajout du paramètre onTap

  const Button({
    super.key,
    required this.color,
    required this.text,
    required this.textColor,
    this.onTap, // Initialisation de onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Exécution de la fonction passée
      child: Container(
        height: 52,
        width: MediaQuery.of(context).size.width / 2.5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
