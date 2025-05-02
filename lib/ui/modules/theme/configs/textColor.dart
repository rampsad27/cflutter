import 'package:flutter/material.dart';

abstract class TextColor {
  late Color black;
  late Color white;
  late Color darkGrey;
  late Color lightGrey;
}

class LightTextColor implements TextColor {
  @override
  Color black = Colors.black;

  @override
  Color darkGrey = const Color.fromARGB(255, 24, 23, 23);

  @override
  Color lightGrey = Colors.grey;

  @override
  Color white = Colors.white;
}

class DarkTextColor implements TextColor {
  @override
  Color black = Colors.white;

  @override
  Color darkGrey = Colors.grey;

  @override
  Color lightGrey = const Color.fromARGB(255, 24, 23, 23);

  @override
  Color white = Colors.black;
}
