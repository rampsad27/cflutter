import 'package:flutter/material.dart';

// class ThemeColorContainer {
//   static Color getProfileButtonBackgroundColor(BuildContext context) {
//     if (Theme.of(context) == AppTheme.lightTheme) {
//       return const Color.fromARGB(255, 204, 55, 55);
//     } else {
//       return const Color.fromARGB(255, 109, 210, 178);
//     }
//   }
// }
class ThemeColorContainer {
  static Color getContainerBackgroundColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    if (brightness == Brightness.light) {
      return const Color.fromARGB(255, 208, 139, 139);
    } else {
      return const Color.fromARGB(255, 59, 60, 60);
    }
  }
}
