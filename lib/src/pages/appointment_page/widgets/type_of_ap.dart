import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:single_option_picker/single_option_picker.dart';
 
 class Type extends StatefulWidget {
  
  const Type({super.key});

  @override
  State<Type> createState() => _TypeState();
}

class _TypeState extends State<Type> {
 
 
  int selectedIndex = 0;
 final  List<String> _category = [
    "\$5",
    "\$15",
    "\$25",
  ];
  final List<String> _imagePath = [
      "lib/asset/images/c.png",
      "lib/asset/images/m.png",
      "lib/asset/images/v.png"
  ];
  @override
  Widget build(BuildContext context) {
    return SingleOptionPicker(
      selectedOptionIndex: selectedIndex,
        numberOfOptions: 3,
        onChangeOption:  (index) {
          setState(() {
            selectedIndex = index;
            });
        },
        optionBuilder: (index, isSelected) =>Container(
            margin:const  EdgeInsets.symmetric(horizontal: 4,vertical: 10),
              height: 120,
              width: 70,

             // width: MediaQuery.of(context).size.width/4,
              decoration: BoxDecoration(
                boxShadow: [
         BoxShadow(
        color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre et son opacité
        spreadRadius: 2, // Étendue de l'ombre
        blurRadius: 7, // Flou de l'ombre
          offset: const Offset(0, 1), // Décalage de l'ombre par rapport au container
         ),
         ],
                borderRadius: BorderRadius.circular(12),
                color: isSelected ? primaryColor : Colors.white,
              ),
              child:   Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
             Image.asset(
             _imagePath[index],
              width: 40,
              height: 40,
              color: isSelected ? bgColor : Colors.black,
          ),
          Text( 
            _category[index],
         style: GoogleFonts.poppins(
         textStyle:  TextStyle(       
         fontSize: 20,
         color: isSelected ? bgColor : Colors.black,
         fontWeight: FontWeight.w500)) ,
            )

        ],),
        )
    );

  }

  }

   