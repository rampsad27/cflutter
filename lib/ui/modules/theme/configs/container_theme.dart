import 'package:flutter/material.dart';

class ThemeColorContainer {
  static Color getProfileButtonBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[850]!
        : Colors.grey[300]!;
  }

  // static Color getGridContainerColor(BuildContext context) {
  //   return Theme.of(context).brightness == Brightness.dark
  //       ? Colors.grey[850]!
  //       : Colors.grey[300]!;
  // }
}
