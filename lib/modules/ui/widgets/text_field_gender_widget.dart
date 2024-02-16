import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldGenderWidget extends StatelessWidget {
  final String name;
  final FocusNode focusNode;
  final Widget destinationPage;

  const TextFieldGenderWidget(
      {Key? key,
      required this.destinationPage,
      required this.focusNode,
      required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destinationPage));
      },
      readOnly: true,
      focusNode: focusNode,
      decoration: InputDecoration(
          suffixIcon: Transform.translate(
            offset: const Offset(28, 28),
            child: const FaIcon(
              FontAwesomeIcons.greaterThan,
              color: Colors.white,
              size: 12,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          labelText: name,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? Colors.white : Colors.white)),
    );
  }
}
