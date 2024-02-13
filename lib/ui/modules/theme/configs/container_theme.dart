import 'package:flutter/material.dart';
import 'package:ig/ui/modules/theme/configs/app_theme.dart';

class ThemeColorContainer {
  static Color getProfileButtonBackgroundColor(BuildContext context) {
    if (Theme.of(context) == AppTheme.lightTheme) {
      return const Color.fromARGB(255, 204, 55, 55);
    } else {
      return const Color.fromARGB(255, 109, 210, 178);
    }
  }
}
