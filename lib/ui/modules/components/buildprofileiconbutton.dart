import 'package:flutter/material.dart';

Widget buildProfileIconButton(IconData icon) {
  return Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 203, 203, 203),
      borderRadius: BorderRadius.circular(8),
    ),
    height: 30,
    width: 32,
    child: Icon(
      icon,
      size: 18,
    ),
  );
}
