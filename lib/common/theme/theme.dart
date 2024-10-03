

import 'package:flutter/material.dart';
//for light theme
ThemeData lightTheme = ThemeData(
useMaterial3: true,
colorScheme: ligthColorScheme,
);

//for dark theme
ThemeData darkTheme = ThemeData(
   useMaterial3: true,
   colorScheme: darkColorScheme,
);
const ligthColorScheme = ColorScheme(
  brightness: Brightness.light, 
  primary: Color(0xFF00606E), 
  onPrimary: Color(0xFFFFFBFE),
   secondary: Color(0xFF016F7C), 
   onSecondary: Color(0xFFFFFBFE), 
   error: Color(0xffB3261E), 
   tertiary: Color(0xFF039EA5),
   onTertiary: Color(0xFFFFFFFF),
   onError: Color(0xFFFFFFFF), 
   //surface definit le background
   surface: Color(0xFFFFFBFE),
    onSurface:Color(0xFFFFFFFF) ,
    );
    const darkColorScheme = ColorScheme (
      brightness: Brightness.dark,
       primary: Color(0xFF00606E), 
       onPrimary: Color(0xFFFFFFFF), 
       secondary:Color(0xFF016F7C) , 
       onSecondary: Color(0xFFFFFFFF), 
       error: Color(0xffB3261E), 
       onError: Color(0xFFFFFFFF), 
       surface: Color(0xFF1C1B1F),
       outline: Color(0XFF938F99),
       onSurface: Color(0xFFFFFFFF),
       );
   
   
   
   /* const primaryColor = Color(0xFF00606E);
const secondaryColor = Color(0xFF016F7C);
const tertiare = Color(0xFF039EA5);
const timeZoneColor = Color(0xFF184D51);
const bgColor =Color(0xFFFFFFFF) ;
const unfocusColor = Color(0xFFEBF5FE);
const Color hintColor = Color.fromRGBO(114, 114, 114, 1);
const Color secondaryTextColor = Color(0xff8f92A1);
const Color primaryTextColor = Color(0xff242424);
const Color primaryIconColor = Color(0xff242424);
const Color alertColor = Color(0xffff0222);*/