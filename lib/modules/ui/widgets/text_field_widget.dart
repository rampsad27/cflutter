import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String name;
  final FocusNode focusNode;
  final String value;
  final VoidCallback onTap;

  const TextFieldWidget(
      {Key? key,
      required this.onTap,
      required this.focusNode,
      required this.name,
      this.value = ''})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  // late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      onTap: widget.onTap,
      readOnly: true,
      focusNode: widget.focusNode,
      // controller: _controller,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        labelText: widget.name,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
            color: widget.focusNode.hasFocus ? Colors.white : Colors.white),
      ),
      controller: TextEditingController()..text = widget.value,
    );
  }
}
