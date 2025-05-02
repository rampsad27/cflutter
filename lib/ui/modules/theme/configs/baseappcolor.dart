import 'package:flutter/material.dart';
import 'package:ig/ui/modules/theme/configs/textColor.dart';

abstract class BaseAppColor {
  late TextColor textColor; //
  // late AccentColor accent; //
  // late ButtonColor buttonColor; //
  // late TextFieldColor textFieldColor; //
  // late Color scaffoldBackgroundColor;
  // late Color borderColor;
  // late Color textFieldBgColor;
  // late Color divider;
  // late Color white;
  // late Color black;

  late Color primary;
  late Color primarytext;
  late Color secondary;
  // late Color error;
  // late Color warning;
  late Color info;
  // late Color success;
  // late Color errorBg;
}

class LightAppColor implements BaseAppColor {
  @override
  TextColor textColor = LightTextColor();

  // @override
  // ButtonColor buttonColor = LightButtonColor();

  // @override
  // TextFieldColor textFieldColor = LightTextFieldColor();

  // @override
  // AccentColor accent = LightAccentColor();

  // @override
  // Color error = const Color(0xFFEF3C3C);

  @override
  Color primary = const Color.fromARGB(255, 240, 238, 238);
  @override
  Color primarytext = const Color.fromARGB(255, 41, 40, 40);

  @override
  Color info = const Color.fromARGB(255, 0, 0, 0);

  @override
  Color secondary = const Color.fromARGB(255, 255, 255, 255);

  // @override
  // Color success = const Color(0xFF439F6E);

  // @override
  // Color warning = const Color(0xFFF3B53C);

  // @override
  // Color scaffoldBackgroundColor = const Color(0xFFFFFFFF);

  // @override
  // Color borderColor = const Color(0xFFD0D5DD);

  // @override
  // Color textFieldBgColor = const Color(0xFFF6F6F6);

  // @override
  // Color divider = const Color(0xFFF6F6F6);

  // @override
  // Color black = const Color(0xFF000000);

  // @override
  // Color white = const Color(0xFFFFFFFF);

  // @override
  // Color errorBg = const Color(0xFFFFF4F4);
}

class DarkAppColor implements BaseAppColor {
  @override
  TextColor textColor = DarkTextColor();

  // @override
  // ButtonColor buttonColor = DarkButtonColor();

  // @override
  // TextFieldColor textFieldColor = DarkTextFieldColor();

  // @override
  // AccentColor accent = DarkAccentColor();

  // @override
  // Color error = const Color(0xFFEF3C3C);

  @override
  Color primary = const Color.fromARGB(255, 0, 0, 0);
  @override
  Color primarytext = const Color.fromARGB(255, 189, 192, 189);

  @override
  Color secondary = const Color.fromARGB(255, 24, 23, 23);

  @override
  Color info = const Color.fromARGB(255, 253, 253, 253);

  // @override
  // Color success = const Color(0xFF439F6E);

  // @override
  // Color warning = const Color(0xFFF3B53C);

  // @override
  // Color scaffoldBackgroundColor = const Color(0xFFFFFFFF);

  // @override
  // Color borderColor = const Color(0xFFD0D5DD);

  // @override
  // Color textFieldBgColor = const Color(0xFFF6F6F6);

  // @override
  // Color divider = const Color(0xFFF6F6F6);

  // @override
  // Color black = const Color(0xFF000000);

  // @override
  // Color white = const Color(0xFFFFFFFF);

  // @override
  // Color errorBg = const Color(0xFFFFF4F4);
}
