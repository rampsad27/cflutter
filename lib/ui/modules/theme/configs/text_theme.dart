import 'package:flutter/material.dart';

class AppTextTheme {
  // poppins font
  static const String poppins = 'Poppins';

  // set headlineLarge
  static TextStyle get headlineLarge => const TextStyle(
        fontFamily: poppins,
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: Colors.black,
      );

  // set headlineMedium
  static TextStyle get headlineMedium => const TextStyle(
        fontFamily: poppins,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Colors.black,
      );

  //set bodyLarge
  static TextStyle get bodyLarge => const TextStyle(
        fontFamily: poppins,
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.black,
      );

  //set bodyMedium
  static TextStyle get bodyMedium => const TextStyle(
        fontFamily: poppins,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.black,
      );

  //set bodySmall
  static TextStyle get bodySmall => const TextStyle(
        fontFamily: poppins,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.black,
      );
}
