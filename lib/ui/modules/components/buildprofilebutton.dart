import 'package:flutter/material.dart';
import 'package:ig/ui/modules/theme/configs/container_theme.dart';

Widget buildProfileButton(String text) {
  // Color backgroundColor = ThemeColorContainer.getProfileButtonBackgroundColor(context);

  return Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 203, 203, 203),
      borderRadius: BorderRadius.circular(8),
    ),
    height: 30,
    width: 167,
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
