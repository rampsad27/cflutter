import 'package:flutter/material.dart';
import 'package:ig/ui/modules/theme/configs/container_theme.dart';

Widget buildProfileButton(BuildContext context, String text) {
  return Container(
    decoration: BoxDecoration(
      color: ThemeColorContainer.getContainerBackgroundColor(context),
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
