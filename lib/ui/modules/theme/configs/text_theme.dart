// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ig/ui/modules/theme/configs/baseappcolor.dart';

class AppTextTheme {
  // Declare variables for different text styles using late initialization.
  // These will be initialized later in the constructor or factory method.
  final BaseAppColor appColor; // The base color for the text theme.
  late final TextStyle headlineMedium; // Medium-sized headlines.
  late final TextStyle headlineLarge; // Large-sized headlines.
  late final TextStyle headlineSmall; // Small-sized headlines.
  late final TextStyle bodyMedium; // Medium-sized body text.
  late final TextStyle bodyLarge; // Large-sized body text.
  late final TextStyle bodySmall; // Small-sized body text.
  AppTextTheme._({
    required this.appColor,
    required this.headlineMedium,
    required this.headlineLarge,
    required this.headlineSmall,
    required this.bodyMedium,
    required this.bodyLarge,
    required this.bodySmall,
  });

  // Factory constructor for creating an instance of AppTextTheme with a given base color.
  // This method allows for easy instantiation of AppTextTheme objects with predefined text styles.
  factory AppTextTheme.withColor(BaseAppColor appColor) {
    return AppTextTheme._(
      appColor: appColor,
      headlineMedium: const TextStyle(
        // Define medium-sized headline style.
        fontFamily: 'Poppins', // Use Poppins font family.
        fontWeight: FontWeight.w700, // Bold weight.
        fontSize: 24, // Font size of 24.
      ),
      headlineLarge: const TextStyle(
        // Define large-sized headline style.
        fontFamily: 'Poppins', // Use Poppins font family.
        fontWeight: FontWeight.w700, // Bold weight.
        fontSize: 32, // Font size of 32.
      ),
      headlineSmall: const TextStyle(
        // Define small-sized headline style.
        fontFamily: 'Poppins', // Use Poppins font family.
        fontWeight: FontWeight.w700, // Bold weight.
        fontSize: 14, // Font size of 14.
      ),
      bodyMedium: const TextStyle(
        // Define medium-sized body text style.
        fontFamily: 'Poppins', // Use Poppins font family.
        fontWeight: FontWeight.w500, // Semi-bold weight.
        fontSize: 14, // Font size of 14.
      ),
      bodyLarge: const TextStyle(
        // Define large-sized body text style.
        fontFamily: 'Poppins', // Use Poppins font family.
        fontWeight: FontWeight.w500, // Semi-bold weight.
        fontSize: 20, // Font size of 20.
      ),
      bodySmall: const TextStyle(
        // Define small-sized body text style.
        fontFamily: 'Poppins', // Use Poppins font family.
        fontWeight: FontWeight.w500, // Semi-bold weight.
        fontSize: 14, // Font size of 14.
      ),
    );
  }
  // Getter method to convert the AppTextTheme object into a standard TextTheme object.
  // This allows the AppTextTheme to be used wherever a TextTheme is expected.
  TextTheme get textTheme => TextTheme(
        headlineMedium: headlineMedium, // Map headlineMedium style.
        headlineLarge: headlineLarge, // Map headlineLarge style.
        headlineSmall: headlineSmall, // Map headlineSmall style.
        bodyMedium: bodyMedium, // Map bodyMedium style.
        bodyLarge: bodyLarge, // Map bodyLarge style.
        bodySmall: bodySmall, // Map bodySmall style.
      );
}
