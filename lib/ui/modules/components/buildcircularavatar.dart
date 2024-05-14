import 'package:flutter/material.dart';

Widget buildCircleAvatar(String imageUrl, double radius) {
  return CircleAvatar(
    radius: radius,
    backgroundImage: NetworkImage(imageUrl),
  );
}
