import 'package:flutter/material.dart';
import 'package:ig/ui/modules/theme/configs/baseappcolor.dart';
import 'package:ig/ui/modules/theme/configs/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme() {
    final appColor = LightAppColor();
    return ThemeData(
      scaffoldBackgroundColor: Colors.white, //Create your own scaffoldColor.

      // The color scheme of the app.
      // The seed color is the primary color of the app.
      // The brightness of the app is set to light.
      // [See more](https://api.flutter.dev/flutter/material/ColorScheme.fromSeed.html)
      colorScheme: ColorScheme.fromSeed(
        // The seed color of the app color scheme.
        // This is the primary color of the app.
        seedColor: appColor.primary,
        // The brightness of the app color scheme.
        // This is the lightness of the app colors.
        brightness: Brightness.light,
      ),

      // The text theme of the app.
      textTheme: AppTextTheme.withColor(appColor).textTheme,

      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => appColor.info),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        showDragHandle: true,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData darkTheme() {
    // The theme data used by the app during dark mode.
    // The scaffold background color is set to black.
    // The brightness of the app is set to dark.
    // The text theme is set to use the dark color.
    // The radio theme is set to use the info color.
    // The bottom sheet theme is set to use the scaffold background color,
    // the drag handle color is set to the border color, and the show drag handle
    // is set to true.
    final appColor = DarkAppColor();
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,

      // The color scheme of the app.
      // The seed color is the primary color of the app.
      // The brightness of the app is set to dark.
      colorScheme: ColorScheme.fromSeed(
        // The seed color of the app color scheme.
        // This is the primary color of the app.
        seedColor: appColor.primary,
        // The brightness of the app color scheme.
        // This is the lightness of the app colors.
        brightness: Brightness.dark,
      ),

      // The text theme of the app.
      textTheme: AppTextTheme.withColor(appColor).textTheme,

      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => appColor.info),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        // The background color of the bottom sheet.
        // This is the background color of the bottom sheet.
        // backgroundColor: appColor.scaffoldBackgroundColor,
        showDragHandle: true,
      ),

      useMaterial3: true,
    );
  }
}
