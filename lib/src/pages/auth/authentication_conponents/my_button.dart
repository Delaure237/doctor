import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isLoading; // Propriété optionnelle pour l'état de chargement

  const MyButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false, // Valeur par défaut à false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: KToolbarHeight,
      child: TextButton(
        onPressed: isLoading ? null : onTap, // Désactiver le bouton si en chargement
        style: TextButton.styleFrom(
          elevation: 4.0,
          backgroundColor: primaryColor,
          foregroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: bgColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: bgColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
