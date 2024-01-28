import 'package:flutter/material.dart';

Widget buildProfileButton(String text) {
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
