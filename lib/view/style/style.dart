import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  Style._();

  // ---------- Color   ---------- //

  static const primaryColor = Color(0xffF43F5E);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const greyColor = Color(0xffEBEEF2);
  static const darkGreyColor=Colors.grey;
  static const darkBgcolorOfApp = Color(0xff0D0D0D);

  // ---------- Gradient   ---------- //

  static const linearGradient = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xffFF1843),
        Color(0xffFF7E95),
      ]);

  static const primaryDisabledColor = Color.fromARGB(244, 235, 134, 164);



  static textStyleRegular(
      {double size = 18,
        Color textColor = blackColor,

      }) =>
      GoogleFonts.sourceSansPro(
          fontWeight: FontWeight.w600,
          color: textColor,


          fontSize: size
      );


  static textStyleRegular2(
      {double size = 16,
        Color textColor = blackColor,

      }) =>
      GoogleFonts.sourceSansPro(
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: size
      );

  static textStyleAuth(
      {double size = 16,
        Color textColor = blackColor,

      }) => TextStyle(
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: size
      );

  static textStyleNorm(
      {double size = 16,
        Color textColor = blackColor,

      }) => TextStyle(
      fontWeight: FontWeight.w400,
      color: textColor,
      fontSize: size
  );
}