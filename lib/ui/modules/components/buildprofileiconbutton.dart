import 'package:flutter/material.dart';
import 'package:ig/ui/modules/theme/configs/container_theme.dart';

Widget buildProfileIconButton(BuildContext context, IconData icon) {
  return Container(
    decoration: BoxDecoration(
      color: ThemeColorContainer.getContainerBackgroundColor(context),
      borderRadius: BorderRadius.circular(8),
    ),
    height: 30,
    width: 32,
    child: Icon(
      icon,
      size: 18,
      // color: Theme.of(context).iconTheme.color,
    ),
  );
}
